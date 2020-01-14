import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';
import 'package:giftmoney/pages/mine_about_page.dart';

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
            onPressed: () {
              
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