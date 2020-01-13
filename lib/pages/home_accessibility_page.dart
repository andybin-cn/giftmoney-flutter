import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';
import 'package:giftmoney/pages/export_records_page.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/native_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeAccessibilityPage extends BaseStatefulPage {
  HomeAccessibilityPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends BasePageState<HomeAccessibilityPage> {

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
              _onExportPress();
            },
          ),
          SettingCell(
            icon: Icon(Icons.save_alt),
            label: Text(i18n.accessibilityImport_button),
            onPressed: () {
              _onImportPress();
            },
          ),
          SettingCell(
            icon: Icon(Icons.history),
            label: Text(i18n.accessibilityHistory_button),
            onPressed: () {
              _onHistoryPress();
            },
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.grey[200]),
    );
  }

  void _onExportPress() async {
    showLoading();
    var path = await TradeService.instance.exportTradesToExcel();
    hideLoading();
    NativeUtils.shareFile(filePath: path, subject: "");
  }
  void _onImportPress() async {
    File file = await FilePicker.getFile();
    this.showLoading();
    var sheet = await NativeUtils.readExcel(filePath: file.path);
    print("_onImportPress readExcel result:${sheet}");
    var importResult = await TradeService.instance.importTrades(sheet);
    this.hideLoading();
    this.showAlert(type: AlertType.success, title: i18n.alertImport_result_title, desc: i18n.alertImport_result(importResult.successCount.toString(), importResult.skipCount.toString(), importResult.errorCount.toString()));
    print("_onImportPress importResult:${importResult}");
  }
  void _onHistoryPress() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return ExportRecordsPage();
        })
      );
  }
}
