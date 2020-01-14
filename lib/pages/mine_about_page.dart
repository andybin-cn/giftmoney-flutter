import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_page.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';

class MineAboutPage extends BaseStatelessPage {
  MineAboutPage({Key key}) : super(key: key, title: I18nUtil.shared.mineAbout);

  @override
  Widget buildBody(BuildContext context) {
    var i18n = I18n.of(context);
    return Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 15)),
      Text(
        i18n.mineAppDescription,
        style: AppTextStyle.reminderText(13),
      ),
      Padding(padding: EdgeInsets.only(top: 15)),
      Text(
        i18n.mineAppVersion(Constant.packageInfo.version),
        style: AppTextStyle.reminderText(13),
      ),
    ]);
  }
}
