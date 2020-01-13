import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';

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
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          SettingCell(
            icon: Icon(Icons.import_export),
            label: Text(i18n.accessibilityExoprt_button),
            onPressed: () {
              
            },
          ),
          SettingCell(
            icon: Icon(Icons.save_alt),
            label: Text(i18n.accessibilityImport_button),
            onPressed: () {
              
            },
          ),
          SettingCell(
            icon: Icon(Icons.history),
            label: Text(i18n.accessibilityHistory_button),
            onPressed: () {
              
            },
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.grey[200]),
    );
  }
}