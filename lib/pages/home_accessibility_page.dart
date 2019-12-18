import 'dart:io';

import 'package:advert_support/advert_support.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';

class HomeAccessibilityPage extends BaseStatefulPage {
  HomeAccessibilityPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomeAccessibilityPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 50, left: 50),
        child: FloatingActionButton(
          onPressed: () async {
            try {
              String adUnitID = "";
              if( Platform.isIOS) {
                adUnitID = "ca-app-pub-3940256099942544/1712485313";
              } else if (Platform.isAndroid) {
                adUnitID = "ca-app-pub-3940256099942544/5224354917";
              }
              var showResult = await AdvertSupport.showRewardVideoAD(adUnitId: adUnitID);
              print("AdvertSupport.showResult:$showResult");
            } catch (error) {
              print("error:$error");
            }
            
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
      )
    ]);
  }
}