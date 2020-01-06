
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/native_utils.dart';

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
            var path = await TradeService.instance.exportTradesToExcel();
            NativeUtils.shareFile(filePath: path, subject: "");
            // await DBManager.instance.keyValue.save(key: "test", value: "123ss");
            // var value = await DBManager.instance.keyValue.valueForKey("test");
            // assert(value == "123ss");
            // try {
            //   String adUnitID = "";
            //   if( Platform.isIOS) {
            //     adUnitID = "ca-app-pub-3940256099942544/1712485313";
            //   } else if (Platform.isAndroid) {
            //     adUnitID = "ca-app-pub-3940256099942544/5224354917";
            //   }
            //   var showResult = await AdvertSupport.showRewardVideoAD(adUnitId: adUnitID);
            //   print("AdvertSupport.showResult:$showResult");
            // } catch (error) {
            //   print("error:$error");
            // }
            
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
      )
    ]);
  }
}