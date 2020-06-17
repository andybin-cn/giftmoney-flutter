import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:giftmoney/api/api_graphql.dart';
import 'package:giftmoney/base/welcome_page.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/pages/main_tab_page.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

import 'generated/l10n.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool loadingApp = true;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    try {
      await Constant.init();
      ShareSDKRegister register = ShareSDKRegister();
      register.setupWechat(
          'wxbd0173ae30cebc1c', '6dfcfe44d9a2e8050bd4c93fffcbc5f3', 'https://andybin.giftmoney/');
      register.setupSinaWeibo('568898243', '38a4f8204cc784f81f9f0daaf31e02e3',
          'https://andybin.giftmoney/');
      register.setupQQ('1109788892', 'PPoe3Nv0wyfoQVEN');
      register.setupFacebook(
          '1412473428822331', 'a42f4f3f867dc947b9ed6020c2e93558', 'shareSDK');
      register.setupTwitter('viOnkeLpHBKs6KXV7MPpeGyzE',
          'NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey', 'https://andybin.giftmoney/');

      //注册
      SharesdkPlugin.regist(register);
      
      await DBManager.instance.initDB();
      await ApiGraphQL.instance.session.initSession();
      AccountService.instance.checkInviteFingerprint();
      this.setState(() {
        loadingApp = false;
      });
    } catch (e) {
      this.setState(() {
        loadingApp = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    // if(loadingApp) {
    //   return WelcomePage();
    // }
    return MaterialApp(
      title: I18nUtil.shared != null ? I18nUtil.shared.app_name : '礼金小助手',
      theme: ThemeData(
        platform: TargetPlatform.iOS,//启用右滑返回
        backgroundColor: AppColor.grayBackground,
        buttonColor: Color(0xFFEDD0BE),
        primarySwatch: MaterialColor(
          0xFFEA5557,
          <int, Color>{
            50: Color(0xFFFFEBEE),
            100: Color(0xFFF49FA1),
            200: Color(0xFFF49FA1),
            300: Color(0xFFF48083),
            400: Color(0xFFF48083),
            500: Color(0xFFEA5557),
            600: Color(0xFFB05C5E),
            700: Color(0xFFB05C5E),
            800: Color(0xFF981C1F),
            900: Color(0xFF981C1F),
          },
        ),
      ),
      home: loadingApp ? WelcomePage() : MainTabPage(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      // localeResolutionCallback: I18n.delegate.resolution(fallback: const Locale('en', '')), //指定语言
    );
  }
}