import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:giftmoney/base/welcome_page.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/environment/constant.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/pages/main_tab_page.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:sharesdk/sharesdk.dart';


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
          "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1");
      register.setupSinaWeibo("568898243", "38a4f8204cc784f81f9f0daaf31e02e3",
          "http://www.sharesdk.cn");
      register.setupQQ("100371282", "aed9b0303e3ed1e27bae87c33761161d");
      register.setupFacebook(
          "1412473428822331", "a42f4f3f867dc947b9ed6020c2e93558", "shareSDK");
      register.setupTwitter("viOnkeLpHBKs6KXV7MPpeGyzE",
          "NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey", "http://mob.com");

      //注册
      ShareSDK.regist(register);
      
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
      title: I18nUtil.shared != null ? I18nUtil.shared.app_name : "礼金小助手",
      theme: ThemeData(
        primarySwatch: Colors.blue,
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