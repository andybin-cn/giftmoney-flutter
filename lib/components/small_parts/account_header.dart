import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/model/account.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/loading_helper.dart';
import 'package:giftmoney/utils/toast_util.dart';

class AccountHeader extends StatefulWidget with PreferredSizeWidget {
  AccountHeader({Key key}) : super(key: key);

  @override
  _AccountHeaderState createState() => _AccountHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(115);
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 110,
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20)),
                Text('我的金币:',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.mainBlackText,
                        fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(left: 10)),
                StreamBuilder<Account>(
                  stream: AccountService.instance.accountSubject.stream,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.coin.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColor.goldColor,
                            fontWeight: FontWeight.w900));
                  },
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color(0xFFEDD0BE),
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('看广告赚取金币'),
                    onPressed: this.earnCoinPressed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color(0xFFEDD0BE),
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('签到获取金币\n(连续签到获取更多金币)', textAlign: TextAlign.center, style: TextStyle(fontSize: 10 )),
                    onPressed: this.earnCoinPressed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                ),
              ],
            )
          ],
        ));
  }

  earnCoinPressed() {
    print('赚取金币 onPressed');
    LoadingHelper.showLoading(context, null, loadingCancelable: true);
    AccountService.instance.earnGold().then((amount) {
      LoadingHelper.hideLoading(context);
      ToastUtil.show('成功赚取${amount}个金币');
    }, onError: (error) {
      LoadingHelper.hideLoading(context);
      print('onError 无法显示广告:${error}');
      if (error['event'] == RewardedVideoAdEvent.closed) {
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
}
