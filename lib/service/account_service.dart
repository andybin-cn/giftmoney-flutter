import 'dart:async';
import 'dart:io';

// import 'package:advert_support/advert_support.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:rxdart/rxdart.dart';

enum ChargeItem {
  insertTrade,
  exportToExcel,
  importFromExcel,
}

class AccountService {
  // 工厂模式
  factory AccountService() => _getInstance();
  static AccountService get instance => _getInstance();
  static AccountService _instance;
  AccountService._internal() {
    if (Platform.isIOS) {
      adUnitID = 'ca-app-pub-3156075797045250/9070048309'; //product
      // adUnitID = 'ca-app-pub-3940256099942544/1712485313'; //test
    } else if (Platform.isAndroid) {
      adUnitID = 'ca-app-pub-3156075797045250/8254562602'; //product
      // adUnitID = 'ca-app-pub-3940256099942544/5224354917'; //test
    }
    // 初始化
    initAccount();
  }
  static AccountService _getInstance() {
    if (_instance == null) {
      _instance = new AccountService._internal();
    }
    return _instance;
  }

  initAccount() async {
    // AdvertSupport.preLoadRewardVideo(adUnitId: adUnitID);
    var isNotFirstLaunch = await DBManager.instance.keyValue
        .valueForKey('AccountService_isNotFirstLaunch');
    if (isNotFirstLaunch == null) {
      this.balanceSubject.add(100);
      DBManager.instance.keyValue
          .save(key: 'AccountService_isNotFirstLaunch', value: 'true');
      DBManager.instance.keyValue.save(
          key: 'AccountService_balance',
          value: this.balanceSubject.value.toString());
    } else {
      var value = await DBManager.instance.keyValue
          .valueForKey('AccountService_balance');
      var balance = int.tryParse(value ?? '0') ?? 0;
      this.balanceSubject.add(balance);
    }
  }

  String adUnitID = '';
  var balanceSubject = BehaviorSubject<int>();

  Future<int> earnGold() async {
    StreamController resultStream = StreamController<int>();
    RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print('RewardedVideoAdEvent:${event}');
      if (event == RewardedVideoAdEvent.loaded) {
        RewardedVideoAd.instance.show();
      }
      switch (event) {
        case RewardedVideoAdEvent.rewarded:
          resultStream.add(rewardAmount);
          resultStream.close();
          break;
        case RewardedVideoAdEvent.failedToLoad:
          resultStream.addError({'event': RewardedVideoAdEvent.failedToLoad, 'meesage': 'failedToLoad'});
          break;
        case RewardedVideoAdEvent.closed:
          if(!resultStream.isClosed) {
            resultStream.addError({'event': RewardedVideoAdEvent.closed, 'meesage': 'canceld'});
          }
          break;
        default:
      }
    };

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['礼金', '份子钱', '红包', '人情', '关系', '关系', '记录'],
      // contentUrl: 'https://flutter.io',// or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>['559D0A7E9DB5DD66B8525DF062E173C5'], // Android emulators are considered test devices
    );
    RewardedVideoAd.instance.load(adUnitId: adUnitID, targetingInfo: targetingInfo);
    var rewardAmount = await resultStream.stream.first;
    balanceSubject.add(balanceSubject.value + rewardAmount);
    DBManager.instance.keyValue.save(
        key: 'AccountService_balance',
        value: this.balanceSubject.value.toString());
    return rewardAmount;
  }

  Future<int> consumeGold(amount) async {
    balanceSubject.add(balanceSubject.value - amount);
    DBManager.instance.keyValue.save(
        key: 'AccountService_balance',
        value: this.balanceSubject.value.toString());
    return balanceSubject.value;
  }

  int amountFor(ChargeItem item) {
    switch (item) {
      case ChargeItem.insertTrade:
        return 1;
      case ChargeItem.exportToExcel:
        return 60;
      case ChargeItem.importFromExcel:
        return 60;
    }
  }

  bool enoughGoldFor(ChargeItem item) {
    if (amountFor(item) <= balanceSubject.value) {
      return true;
    } else {
      return false;
    }
  }
}
