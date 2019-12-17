import 'package:advert_support/advert_support.dart';
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
      FloatingActionButton(
        onPressed: () async {
          try {
            var showResult = await AdvertSupport.showRewardVideoAD(adUnitId: "ca-app-pub-3940256099942544/5224354917");
            print("AdvertSupport.showResult:$showResult");
          } catch (error) {
            print("error:$error");
          }
          
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),

      )
    ],);
  }
}