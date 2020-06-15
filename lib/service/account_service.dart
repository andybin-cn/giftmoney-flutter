import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:advert_support/advert_support.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:giftmoney/api/api_graphql.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/account.dart';
import 'package:giftmoney/model/author_anonymous_req.dart';
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

  String adUnitID = '';
  var accountSubject = BehaviorSubject<Account>();
  initAccount() async {
    accountSubject.listen((value) {
      DBManager.instance.keyValue.save(
        key: 'AccountService_current',
        value: jsonEncode(this.accountSubject.value));
    });
    var currentStr = await DBManager.instance.keyValue.valueForKey("AccountService_current");
    try {
      var current = Account.fromJSON(JsonDecoder().convert(currentStr));
      accountSubject.add(current);
    } catch(error) {
      var current = Account();
      current.coin = 100;
      accountSubject.add(current);
    }
  }

  Future<Account> loginAnonymity() async {
    AuthorAnonymousReq authorReq;
    var authorReqStr = await DBManager.instance.keyValue.valueForKey("AccountService_authorReq");
    try {
      authorReq = AuthorAnonymousReq.fromJSON(JsonDecoder().convert(authorReqStr));
      authorReq.timestamp = DateTime.now().toIso8601String();
      var bytes = utf8.encode('gift+${authorReq.uuid}-money+${authorReq.timestamp}');
      authorReq.accessToken = sha512.convert(bytes).toString();
    } catch(error) {
      authorReq = AuthorAnonymousReq();
      authorReq.timestamp = DateTime.now().toIso8601String();
      var bytes = utf8.encode('gift+-money+${authorReq.timestamp}');
      authorReq.accessToken = sha512.convert(bytes).toString();
    }
    var result = await ApiGraphQL.instance.loginAnonymity(authorReq);
    var account = accountSubject.value;
    account.token = result['token'];
    account.id = result['user']['id'];
    accountSubject.add(account);

    authorReq.uuid = result['user']['anonymous_uuid'];
    var bytes = utf8.encode('gift+${authorReq.uuid}-money+${authorReq.timestamp}');
    authorReq.accessToken = sha512.convert(bytes).toString();
    await DBManager.instance.keyValue.save(key: 'AccountService_authorReq', value: jsonEncode(authorReq.toJSON()));
    return account;
  }

  checkInviteFingerprint() async {
    
  }

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
    var account = accountSubject.value;
    account.coin += rewardAmount;
    accountSubject.add(account);
    return rewardAmount;
  }

  Future<int> consumeGold(amount) async {
    var account = accountSubject.value;
    account.coin -= amount;
    accountSubject.add(account);

    return account.coin;
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
    if (amountFor(item) <= accountSubject.value.coin) {
      return true;
    } else {
      return false;
    }
  }
}
