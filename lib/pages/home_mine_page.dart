import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';
import 'package:giftmoney/pages/mine_about_page.dart';
import 'package:sharesdk/sharesdk.dart';

class HomeMinePage extends BaseStatefulPage {
  HomeMinePage({Key key}) : super(key: key);

  @override
  _HomeMinePageState createState() => _HomeMinePageState();
}

class _HomeMinePageState extends BasePageState<HomeMinePage> {
  
  @override
  Widget buildContainer(BuildContext context) {
    
    return Scaffold(
      extendBody: true,
      appBar: AccountHeader(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: this.buildSelfScrollBody(context) ?? this.buildScrollView(context),
      )
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return DecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          SettingCell(
            icon: Icon(Icons.share),
            label: Text(i18n.mineInvite),
            onPressed: () async {
              var shareParams = SSDKMap();
              shareParams.setGeneral("测试", "内容测试", null, null, null, "http://www.baidu.com", null, null, null, SSDKContentTypes.webpage);
              var result = await ShareSDK.showMenu([ShareSDKPlatforms.wechatTimeline, ShareSDKPlatforms.qZone, ShareSDKPlatforms.sina, ShareSDKPlatforms.douBan], shareParams, 
                (state, platform, info, detail, error) {
                  print("share state:${state} platform:${platform} info:${info} detail:${detail} error:${error}");
                });
              print("showMenu result:${result}");
            },
          ),
          SettingCell(
            icon: Icon(Icons.info_outline),
            label: Text(i18n.mineAbout),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                    return MineAboutPage();
                })
              );
            },
          ),
          SettingCell(
            icon: Icon(Icons.feedback),
            label: Text(i18n.mineFeedback),
            onPressed: () {
              
            },
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.grey[200]),
    );
  }
}