import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
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
  Widget buildBody(BuildContext context) {
    return DecoratedBox(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          FlatButton(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 15, bottom: 15),
              margin: EdgeInsets.only(bottom: 0.5),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Icon(Icons.import_export),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Expanded(child: Text(i18n.accessibilityExoprt_button)),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding: EdgeInsets.only(left: 15)),
                ],
              ),
            ),
            onPressed: () {
              _onExportPress();
            },
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 0.5),
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Icon(Icons.save_alt),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Expanded(child: Text(i18n.accessibilityImport_button)),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding: EdgeInsets.only(left: 15)),
                ],
              ),
            ),
            onPressed: () {
              _onImportPress();
            },
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 0.5),
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Icon(Icons.history),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Expanded(child: Text(i18n.accessibilityHistory_button)),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding: EdgeInsets.only(left: 15)),
                ],
              ),
            ),
            onPressed: () {
              _onHistoryPress();
            },
          ),
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
