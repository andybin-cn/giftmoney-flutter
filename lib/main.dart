import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:giftmoney/base/welcome_page.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/pages/main_tab_page.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';


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
      
      DBManager.instance.initDB().whenComplete(() {
        this.setState(() {
          loadingApp = false;
        });
      });
    } catch (e) {
      this.setState(() {
        loadingApp = false;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: I18nUtil.shared != null ? I18nUtil.shared.app_name : '礼金小助手',
      theme: ThemeData(
        backgroundColor: AppColor.grayBackground,
        buttonColor: Color(0xFFEDD0BE),
        primarySwatch: MaterialColor(
          0xFFE03636,
          <int, Color>{
            50: Color(0xFFFFEBEE),
            100: Color(0xFFFFCDD2),
            200: Color(0xFFFF534D),
            300: Color(0xFFE53935),
            400: Color(0xFFE53935),
            500: Color(0xFFE03636),
            600: Color(0xFFD32F2F),
            700: Color(0xFFC62828),
            800: Color(0xFFC62828),
            900: Color(0xFFB71C1C),
          },
        ),
      ),
      home: loadingApp ? WelcomePage() : MainTabPage(),
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      // localeResolutionCallback: I18n.delegate.resolution(fallback: const Locale('en', '')), //指定语言
    );
  }
}