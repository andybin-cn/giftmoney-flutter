import 'package:flutter/material.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChargeItemCheckHelp {
  static bool canChargeForItem(BuildContext context, ChargeItem item) {
    if (!AccountService.instance.enoughGoldFor(item)) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "金币不足",
        desc: "此操作需要${AccountService.instance.amountFor(item)}个金币",
        buttons: [
          DialogButton(
            child: Text(
              "看广告赚金币",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () => Navigator.pop(context)
          )
        ],
      ).show();
      return false;
    }
    return true;
  }
}
