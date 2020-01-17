import 'package:flutter/material.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/utils/toast_util.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChargeItemCheckHelp {
  static bool canChargeForItem(BuildContext context, ChargeItem item) {
    if (!AccountService.instance.enoughGoldFor(item)) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "金币不足",
        desc: "此操作需要${AccountService.instance.amountFor(item)}个金币\n当前剩余${AccountService.instance.balanceSubject.value}个金币",
        buttons: [
          DialogButton(
            child: Text(
              "看广告赚金币",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () async {
              Navigator.pop(context);
              AccountService.instance.earnGold().catchError((error) {
                print("catchError 无法显示广告");
                ToastUtil.show("catchError 无法显示广告");
              }).then((amount) {
                ToastUtil.show("成功赚取${amount}个金币");
              }, onError: (error) {
                print("onError 无法显示广告");
                ToastUtil.show("onError 无法显示广告");
              });
            }
          )
        ],
      ).show();
      return false;
    }
    return true;
  }
}
