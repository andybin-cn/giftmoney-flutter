import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/pages/main_tab_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool isLoadingDB = true;

  @override
  void initState() {
    super.initState();
    DBManager.instance.initDB().whenComplete(() {
      this.setState(() {
        isLoadingDB = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoadingDB) {
      return CircularProgressIndicator();
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainTabPage(),
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