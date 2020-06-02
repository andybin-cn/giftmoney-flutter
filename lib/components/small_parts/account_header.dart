import 'package:flutter/material.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/loading_helper.dart';
import 'package:giftmoney/utils/toast_util.dart';

class AccountHeader extends StatefulWidget with PreferredSizeWidget {
  AccountHeader({Key key}) : super(key: key);

  @override
  _AccountHeaderState createState() => _AccountHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(180);
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).primaryColor,
      height: 150,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的金币', style: TextStyle(fontSize: 16, color: AppColor.mainBlackText)),
                StreamBuilder<int>(
                  stream: AccountService.instance.balanceSubject.stream,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString(), style: TextStyle(fontSize: 30, color: AppColor.goldColor, fontWeight: FontWeight.w800));
                  },
                )
              ],
            ),
          ),
          RaisedButton(
            color: AppColor.secondaryAppColor,
            textColor: Colors.white,
            child: Text('看广告赚取金币'),
            onPressed: () async {
              print('赚取金币 onPressed');
              LoadingHelper.showLoading(context, null, loadingCancelable: true);
              AccountService.instance.earnGold().then((amount) {
                LoadingHelper.hideLoading(context);
                ToastUtil.show('成功赚取${amount}个金币');
              }, onError: (error) {
                LoadingHelper.hideLoading(context);
                print('onError 无法显示广告');
                ToastUtil.show('无法显示广告');
              }).catchError((error) {
                print('catchError 无法显示广告');
                ToastUtil.show('无法显示广告');
                LoadingHelper.hideLoading(context);
              });
            },
          ),
          Padding(padding: EdgeInsets.only(right: 15),)
        ],
      ),
    );
  }
}
