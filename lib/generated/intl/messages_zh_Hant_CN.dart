// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_Hant_CN';

  static m0(success, skipped, failed) => "成功: ${success} 條記錄\n忽略: ${skipped} 條記錄\n失敗: ${failed} 條記錄";

  static m1(version) => "版本：${version}";

  static m2(count) => "${count}個聯繫人";

  static m3(count) => "${count}條記錄";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accessibility_exoprt_button" : MessageLookupByLibrary.simpleMessage("導出至Excel"),
    "accessibility_history_button" : MessageLookupByLibrary.simpleMessage("歷史記錄（導出數據）"),
    "accessibility_import_button" : MessageLookupByLibrary.simpleMessage("從Excel導入數據"),
    "alert_import_result" : m0,
    "alert_import_result_title" : MessageLookupByLibrary.simpleMessage("導入完成"),
    "alert_ok_button" : MessageLookupByLibrary.simpleMessage("好的"),
    "app_name" : MessageLookupByLibrary.simpleMessage("禮金小助手"),
    "bt_delete" : MessageLookupByLibrary.simpleMessage("刪除"),
    "bt_save" : MessageLookupByLibrary.simpleMessage("保存"),
    "bt_upload_success" : MessageLookupByLibrary.simpleMessage("已上傳"),
    "bt_upload_uploading" : MessageLookupByLibrary.simpleMessage("正在上傳"),
    "bt_upload_waiting" : MessageLookupByLibrary.simpleMessage("未上傳"),
    "bt_upload_waring" : MessageLookupByLibrary.simpleMessage("上傳失敗"),
    "excel_header_createAt" : MessageLookupByLibrary.simpleMessage("創建時間"),
    "excel_header_eventID" : MessageLookupByLibrary.simpleMessage("事件ID"),
    "excel_header_eventName" : MessageLookupByLibrary.simpleMessage("事件名稱"),
    "excel_header_eventTime" : MessageLookupByLibrary.simpleMessage("事件時間"),
    "excel_header_giftName" : MessageLookupByLibrary.simpleMessage("禮物名稱"),
    "excel_header_id" : MessageLookupByLibrary.simpleMessage("ID"),
    "excel_header_personID" : MessageLookupByLibrary.simpleMessage("人物ID"),
    "excel_header_personName" : MessageLookupByLibrary.simpleMessage("姓名"),
    "excel_header_relationID" : MessageLookupByLibrary.simpleMessage("關係ID"),
    "excel_header_relationName" : MessageLookupByLibrary.simpleMessage("關係"),
    "excel_header_remark" : MessageLookupByLibrary.simpleMessage("備註"),
    "excel_header_type" : MessageLookupByLibrary.simpleMessage("類型"),
    "excel_header_unit" : MessageLookupByLibrary.simpleMessage("單位"),
    "excel_header_updateAt" : MessageLookupByLibrary.simpleMessage("修改時間"),
    "excel_header_value" : MessageLookupByLibrary.simpleMessage("金額"),
    "excel_header_valueType" : MessageLookupByLibrary.simpleMessage("數據類型"),
    "form_amount" : MessageLookupByLibrary.simpleMessage("金額"),
    "form_error" : MessageLookupByLibrary.simpleMessage("表單填寫不正確"),
    "form_event_name" : MessageLookupByLibrary.simpleMessage("事件名稱"),
    "form_event_time" : MessageLookupByLibrary.simpleMessage("事件時間"),
    "form_gift" : MessageLookupByLibrary.simpleMessage("禮物"),
    "form_in_account" : MessageLookupByLibrary.simpleMessage("收份子"),
    "form_out_account" : MessageLookupByLibrary.simpleMessage("送份子"),
    "form_person_name" : MessageLookupByLibrary.simpleMessage("姓名"),
    "form_relation" : MessageLookupByLibrary.simpleMessage("關係"),
    "form_type" : MessageLookupByLibrary.simpleMessage("類型"),
    "hud_loading" : MessageLookupByLibrary.simpleMessage("正在加載"),
    "hud_save_success" : MessageLookupByLibrary.simpleMessage("保存成功"),
    "hud_saving" : MessageLookupByLibrary.simpleMessage("正在保存"),
    "mine_about" : MessageLookupByLibrary.simpleMessage("關於我們"),
    "mine_appDescription" : MessageLookupByLibrary.simpleMessage("1.我們是個人開發愛好者，希望我們的App能夠幫助你解決一些實際問題，給你的生活帶來便利。 \n\n2.我們會對你的數據進行加密保護，可以放心使用。 \n\n\n\n如遇到任何問題，請發送郵件至：reciprocityApp@163.com\n我們會盡快與您聯繫"),
    "mine_appVersion" : m1,
    "mine_coin_rules" : MessageLookupByLibrary.simpleMessage("金幣使用規則"),
    "mine_feedback" : MessageLookupByLibrary.simpleMessage("意見反饋"),
    "mine_invite" : MessageLookupByLibrary.simpleMessage("推薦給好友（賺金幣）"),
    "mine_privacy" : MessageLookupByLibrary.simpleMessage("《隐私政策》与《用户协议》"),
    "mine_setting" : MessageLookupByLibrary.simpleMessage("設置"),
    "share_douBan" : MessageLookupByLibrary.simpleMessage("豆瓣"),
    "share_facebook" : MessageLookupByLibrary.simpleMessage("Facebook"),
    "share_other" : MessageLookupByLibrary.simpleMessage("其他"),
    "share_qZone" : MessageLookupByLibrary.simpleMessage("QQ空間"),
    "share_qq" : MessageLookupByLibrary.simpleMessage("QQ好友"),
    "share_sina" : MessageLookupByLibrary.simpleMessage("新浪微博"),
    "share_twitter" : MessageLookupByLibrary.simpleMessage("推特"),
    "share_wechat" : MessageLookupByLibrary.simpleMessage("微信好友"),
    "share_wechatTimeline" : MessageLookupByLibrary.simpleMessage("朋友圈"),
    "statistics_contact_group" : MessageLookupByLibrary.simpleMessage("聯繫人"),
    "statistics_contactsCount" : m2,
    "statistics_event_group" : MessageLookupByLibrary.simpleMessage("事件"),
    "statistics_recordCount" : m3,
    "statistics_relation_group" : MessageLookupByLibrary.simpleMessage("關係"),
    "statistics_title" : MessageLookupByLibrary.simpleMessage("分組統計"),
    "tab_accessibility" : MessageLookupByLibrary.simpleMessage("輔助"),
    "tab_chart" : MessageLookupByLibrary.simpleMessage("統計"),
    "tab_mine" : MessageLookupByLibrary.simpleMessage("我的"),
    "tab_record" : MessageLookupByLibrary.simpleMessage("記錄"),
    "tab_record_title" : MessageLookupByLibrary.simpleMessage("所有記錄"),
    "validation_amount" : MessageLookupByLibrary.simpleMessage("請填寫金額"),
    "validation_date_notEmpty" : MessageLookupByLibrary.simpleMessage("請選擇日期"),
    "validation_event_name" : MessageLookupByLibrary.simpleMessage("請填寫事件名稱"),
    "validation_mobile" : MessageLookupByLibrary.simpleMessage("請填寫手機號"),
    "validation_notEmpty" : MessageLookupByLibrary.simpleMessage("不能為空"),
    "validation_number" : MessageLookupByLibrary.simpleMessage("請填寫數字"),
    "validation_relation" : MessageLookupByLibrary.simpleMessage("請填寫關係"),
    "validation_userName" : MessageLookupByLibrary.simpleMessage("請填寫姓名")
  };
}
