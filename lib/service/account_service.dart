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
      adUnitID = "ca-app-pub-3156075797045250/9070048309"; //product
      // adUnitID = "ca-app-pub-3940256099942544/1712485313"; //test
    } else if (Platform.isAndroid) {
      adUnitID = "ca-app-pub-3156075797045250/8254562602"; //product
      // adUnitID = "ca-app-pub-3940256099942544/5224354917"; //test
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
    var amount = 0;
    if(showResult["amount"] != null) {
      amount = 20;
    }
    // var amount = int.tryParse(showResult["amount"] ?? "0") ?? 0;
    balanceSubject.add(balanceSubject.value + 20);
    DBManager.instance.keyValue.save(
        key: "AccountService_balance",
        value: this.balanceSubject.value.toString());
    return amount;
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
        return 1;
      case ChargeItem.exportToExcel:
        return 50;
      case ChargeItem.importFromExcel:
        return 50;
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
