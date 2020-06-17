import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_page.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/generated/l10n.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';

class MineAboutPage extends BaseStatelessPage {
  MineAboutPage({Key key}) : super(key: key, title: I18nUtil.shared.mine_about);

  @override
  Widget buildBody(BuildContext context) {
    var i18n = S.of(context);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(i18n.mine_appDescription, style: AppTextStyle.mainText(15)),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(i18n.mine_appVersion(Constant.packageInfo.version), style: AppTextStyle.mainText(15)),
            ],
          )
        ])
    );
  }
}
