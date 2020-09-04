import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';
import 'package:giftmoney/pages/mine_about_page.dart';
import 'package:giftmoney/pages/privacy_policy_page.dart';
import 'package:giftmoney/pages/rules_for_gold_coins_page.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/charge_item_check_help.dart';
import 'package:giftmoney/utils/native_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

import 'export_records_page.dart';

class HomeMinePage extends BaseStatefulPage {
  HomeMinePage({Key key}) : super(key: key);

  @override
  _HomeMinePageState createState() => _HomeMinePageState();
}

class _HomeMinePageState extends BasePageState<HomeMinePage> {
  @override
  void initState() {
    super.initState();
    title = "我的";
  }

  void _onExportPress() async {
    if (!ChargeItemCheckHelp.canChargeForItem(
        context, ChargeItem.exportToExcel)) {
      return;
    }
    showLoading();
    TradeService.instance.exportTradesToExcel().then((path) {
      hideLoading();
      NativeUtils.shareFile(filePath: path, subject: '');
    }, onError: (Object error, StackTrace stack) {
      this.catchError(error);
    });
  }

  void _onImportPress() async {
    if (!ChargeItemCheckHelp.canChargeForItem(
        context, ChargeItem.importFromExcel)) {
      return;
    }
    try {
      File file = await FilePicker.getFile();
      if (file == null) {
        return;
      }
      this.showLoading();
      var sheet = await NativeUtils.readExcel(filePath: file.path);
      print('_onImportPress readExcel result:${sheet}');
      var importResult = await TradeService.instance.importTrades(sheet);
      this.hideLoading();
      this.showAlert(
          type: AlertType.success,
          title: i18n.alert_import_result_title,
          desc: i18n.alert_import_result(
              importResult.successCount.toString(),
              importResult.skipCount.toString(),
              importResult.errorCount.toString()));
      print('_onImportPress importResult:${importResult}');
    } catch (error) {
      this.catchError(error);
    }
  }

  void _onHistoryPress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ExportRecordsPage();
    }));
  }

  void _onFeedbackPress() async {
    final Email email = Email(
      body: '\n\n感谢您的宝贵意见，我们会尽快给您回复。谢谢！',
      subject: '【礼金小助手App】意见反馈',
      recipients: ['reciprocityApp@163.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPath: '/path/to/attachment.zip',
      isHTML: false,
    );
    await FlutterEmailSender.send(email).catchError((error) {
      this.showAlert(
        desc: '无法打开邮件，您可以发送邮件至 reciprocityApp@163.com 我们会尽快给您回复!',
        buttons: [
          DialogButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              }),
          DialogButton(
              child: Text('复制邮箱地址'),
              onPressed: () {
                Clipboard.setData(
                    new ClipboardData(text: 'reciprocityApp@163.co'));
                showHUD('邮箱地址已复制');
                Navigator.pop(context);
              }),
        ],
      );
      //
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return DecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          AccountHeader(),
          Padding(padding: EdgeInsets.only(top: 0.5)),
          SettingCell(
            icon: Icon(Icons.account_balance_wallet),
            label: Text(i18n.mine_coin_rules),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RulesForGoldCoinsPage();
              }));
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          SettingCell(
            icon: Icon(Icons.save_alt),
            label: Text(i18n.accessibility_import_button),
            onPressed: () {
              _onImportPress();
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          SettingCell(
            icon: Icon(Icons.import_export),
            label: Text(i18n.accessibility_exoprt_button),
            onPressed: () {
              _onExportPress();
            },
          ),
          SettingCell(
            icon: Icon(Icons.history),
            label: Text(i18n.accessibility_history_button),
            onPressed: () {
              _onHistoryPress();
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          SettingCell(
            icon: Icon(Icons.share),
            label: Text(i18n.mine_invite),
            onPressed: () async {},
          ),
          SettingCell(
            icon: Icon(Icons.info_outline),
            label: Text(i18n.mine_about),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MineAboutPage();
              }));
            },
          ),
          SettingCell(
            icon: Icon(Icons.feedback),
            label: Text(i18n.mine_feedback),
            onPressed: _onFeedbackPress,
          ),
          // SettingCell(
          //   icon: Icon(Icons.lock_outline),
          //   label: Text(i18n.mine_privacy),
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return PrivacyPolicyPage();
          //     }));
          //   },
          // )
        ],
      ),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
    );
  }
}
