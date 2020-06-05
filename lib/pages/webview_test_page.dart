import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_page.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/utils/screen_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTestPage extends BaseStatelessPage {
  WebViewTestPage({Key key}) : super(key: key, title: I18nUtil.shared.mineAbout);

  @override
  Widget buildSelfScrollBody(BuildContext context) {
    var i18n = I18n.of(context);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight - 80,
      child: WebView(
        initialUrl: 'https://darling-secret.herokuapp.com/share/web',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
