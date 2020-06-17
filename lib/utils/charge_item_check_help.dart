import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/utils/loading_helper.dart';
import 'package:giftmoney/utils/toast_util.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChargeItemCheckHelp {
  static bool canChargeForItem(BuildContext context, ChargeItem item) {
    if (!AccountService.instance.enoughGoldFor(item)) {
      Alert(
        context: context,
        type: AlertType.error,
        title: '金币不足',
        desc: '此操作需要${AccountService.instance.amountFor(item)}个金币\n当前剩余${AccountService.instance.accountSubject.value.coin}个金币',
        buttons: [
          DialogButton(
            child: Text(
              '看广告赚金币',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              Navigator.pop(context);
              LoadingHelper.showLoading(context, null, loadingCancelable: true);
              AccountService.instance.earnGold().then((amount) {
                LoadingHelper.hideLoading(context);
                ToastUtil.show('成功赚取${amount}个金币');
              }, onError: (error) {
                LoadingHelper.hideLoading(context);
                print('onError 无法显示广告');
                if(error['event'] == RewardedVideoAdEvent.closed) {
                  ToastUtil.show('用户取消操作');
                } else {
                  ToastUtil.show('无法显示广告');
                }
              }).catchError((error) {
                print('catchError 无法显示广告:${error}');
                ToastUtil.show('无法显示广告');
                LoadingHelper.hideLoading(context);
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
