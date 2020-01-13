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
        title: "",
        desc: "",
        buttons: [
          DialogButton(
            child: Text(
              I18n.of(context).alertOk_button,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () => Navigator.pop(context)
          ),
          DialogButton(
            child: Text(
              I18n.of(context).alertOk_button,
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
