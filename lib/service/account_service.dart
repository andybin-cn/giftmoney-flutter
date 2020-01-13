import 'dart:io';

import 'package:advert_support/advert_support.dart';
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
      adUnitID = "ca-app-pub-3940256099942544/1712485313";
    } else if (Platform.isAndroid) {
      // ca-app-pub-3156075797045250/8254562602
      adUnitID = "ca-app-pub-3940256099942544/5224354917";
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
    AdvertSupport.preLoadRewardVideo(adUnitId: adUnitID);
    var isNotFirstLaunch = await DBManager.instance.keyValue
        .valueForKey("AccountService_isNotFirstLaunch");
    if (isNotFirstLaunch == null) {
      this.balanceSubject.add(100);
      DBManager.instance.keyValue
          .save(key: "AccountService_isNotFirstLaunch", value: "true");
      DBManager.instance.keyValue.save(
          key: "AccountService_balance",
          value: this.balanceSubject.value.toString());
    } else {
      var value = await DBManager.instance.keyValue
          .valueForKey("AccountService_balance");
      var balance = int.tryParse(value ?? "0") ?? 0;
      this.balanceSubject.add(balance);
    }
  }

  String adUnitID = "";
  var balanceSubject = BehaviorSubject<int>();

  Future<int> earnGold() async {
    var showResult = await AdvertSupport.showRewardVideoAD(adUnitId: adUnitID);
    print("earnGold result:${showResult}");
    var amount = int.tryParse(showResult["amount"] ?? "0") ?? 0;
    balanceSubject.add(balanceSubject.value + amount);
    DBManager.instance.keyValue.save(
        key: "AccountService_balance",
        value: this.balanceSubject.value.toString());
    return balanceSubject.value;
  }

  Future<int> consumeGold(amount) async {
    balanceSubject.add(balanceSubject.value - amount);
    DBManager.instance.keyValue.save(
        key: "AccountService_balance",
        value: this.balanceSubject.value.toString());
    return balanceSubject.value;
  }

  int amountFor(ChargeItem item) {
    switch (item) {
      case ChargeItem.insertTrade:
        return 5;
      case ChargeItem.exportToExcel:
        return 100;
      case ChargeItem.importFromExcel:
        return 50;
    }
  }

  bool checkGoldFor(ChargeItem item) {
    if (amountFor(item) <= balanceSubject.value) {
      return true;
    } else {
      return false;
    }
  }
}
