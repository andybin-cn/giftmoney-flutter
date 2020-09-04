// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(success, skipped, failed) => "Success: ${success} records\nIgnored: ${skipped} records\nFailed: ${failed} records";

  static m1(version) => "Version:${version}";

  static m2(count) => "${count} Contacts";

  static m3(count) => "${count} Records";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accessibility_exoprt_button" : MessageLookupByLibrary.simpleMessage("Export Recods to Excel"),
    "accessibility_history_button" : MessageLookupByLibrary.simpleMessage("Export Historys"),
    "accessibility_import_button" : MessageLookupByLibrary.simpleMessage("Import Recods from Excel"),
    "alert_import_result" : m0,
    "alert_import_result_title" : MessageLookupByLibrary.simpleMessage("improt finished"),
    "alert_ok_button" : MessageLookupByLibrary.simpleMessage("OK"),
    "app_name" : MessageLookupByLibrary.simpleMessage("GiftMoney"),
    "bt_delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "bt_save" : MessageLookupByLibrary.simpleMessage("Save"),
    "bt_upload_success" : MessageLookupByLibrary.simpleMessage("done"),
    "bt_upload_uploading" : MessageLookupByLibrary.simpleMessage("doing"),
    "bt_upload_waiting" : MessageLookupByLibrary.simpleMessage("waiting"),
    "bt_upload_waring" : MessageLookupByLibrary.simpleMessage("waring"),
    "excel_header_createAt" : MessageLookupByLibrary.simpleMessage("createAt"),
    "excel_header_eventID" : MessageLookupByLibrary.simpleMessage("eventID"),
    "excel_header_eventName" : MessageLookupByLibrary.simpleMessage("eventName"),
    "excel_header_eventTime" : MessageLookupByLibrary.simpleMessage("eventTime"),
    "excel_header_giftName" : MessageLookupByLibrary.simpleMessage("giftName"),
    "excel_header_id" : MessageLookupByLibrary.simpleMessage("ID"),
    "excel_header_personID" : MessageLookupByLibrary.simpleMessage("personID"),
    "excel_header_personName" : MessageLookupByLibrary.simpleMessage("personName"),
    "excel_header_relationID" : MessageLookupByLibrary.simpleMessage("relationID"),
    "excel_header_relationName" : MessageLookupByLibrary.simpleMessage("relation"),
    "excel_header_remark" : MessageLookupByLibrary.simpleMessage("remark"),
    "excel_header_type" : MessageLookupByLibrary.simpleMessage("type"),
    "excel_header_unit" : MessageLookupByLibrary.simpleMessage("unit"),
    "excel_header_updateAt" : MessageLookupByLibrary.simpleMessage("updateAt"),
    "excel_header_value" : MessageLookupByLibrary.simpleMessage("value"),
    "excel_header_valueType" : MessageLookupByLibrary.simpleMessage("valueType"),
    "form_amount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "form_error" : MessageLookupByLibrary.simpleMessage("The form was not filled out correctly"),
    "form_event_name" : MessageLookupByLibrary.simpleMessage("Thing"),
    "form_event_time" : MessageLookupByLibrary.simpleMessage("When"),
    "form_gift" : MessageLookupByLibrary.simpleMessage("Gift"),
    "form_in_account" : MessageLookupByLibrary.simpleMessage("Income"),
    "form_out_account" : MessageLookupByLibrary.simpleMessage("Give away"),
    "form_person_name" : MessageLookupByLibrary.simpleMessage("Name"),
    "form_relation" : MessageLookupByLibrary.simpleMessage("Relation"),
    "form_type" : MessageLookupByLibrary.simpleMessage("Money"),
    "hud_loading" : MessageLookupByLibrary.simpleMessage("Loading"),
    "hud_save_success" : MessageLookupByLibrary.simpleMessage("Success"),
    "hud_saving" : MessageLookupByLibrary.simpleMessage("Saving"),
    "mine_about" : MessageLookupByLibrary.simpleMessage("About Me"),
    "mine_appDescription" : MessageLookupByLibrary.simpleMessage("1. We are personal development enthusiasts. We hope our App can help you solve some practical problems and bring convenience to your life. \n\n2. We will encrypt and protect your data, so you can use it with confidence. \n\n\n\nIf you encounter any problems, please send email to: reciprocityApp@163.com \nWe will contact you as soon as possible"),
    "mine_appVersion" : m1,
    "mine_coin_rules" : MessageLookupByLibrary.simpleMessage("Rules for using gold coins"),
    "mine_feedback" : MessageLookupByLibrary.simpleMessage("Feedback"),
    "mine_invite" : MessageLookupByLibrary.simpleMessage("Recommend to earn coins"),
    "mine_privacy" : MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "mine_setting" : MessageLookupByLibrary.simpleMessage("Settings"),
    "share_douBan" : MessageLookupByLibrary.simpleMessage("DouBan"),
    "share_facebook" : MessageLookupByLibrary.simpleMessage("Facebook"),
    "share_other" : MessageLookupByLibrary.simpleMessage("Other"),
    "share_qZone" : MessageLookupByLibrary.simpleMessage("QQZone"),
    "share_qq" : MessageLookupByLibrary.simpleMessage("QQ"),
    "share_sina" : MessageLookupByLibrary.simpleMessage("Sina"),
    "share_twitter" : MessageLookupByLibrary.simpleMessage("Twitter"),
    "share_wechat" : MessageLookupByLibrary.simpleMessage("WeChat"),
    "share_wechatTimeline" : MessageLookupByLibrary.simpleMessage("Moment"),
    "statistics_contact_group" : MessageLookupByLibrary.simpleMessage("Contacts"),
    "statistics_contactsCount" : m2,
    "statistics_event_group" : MessageLookupByLibrary.simpleMessage("Things"),
    "statistics_recordCount" : m3,
    "statistics_relation_group" : MessageLookupByLibrary.simpleMessage("Relations"),
    "statistics_title" : MessageLookupByLibrary.simpleMessage("Grouping statistics"),
    "tab_accessibility" : MessageLookupByLibrary.simpleMessage("Assist"),
    "tab_chart" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "tab_mine" : MessageLookupByLibrary.simpleMessage("Mine"),
    "tab_record" : MessageLookupByLibrary.simpleMessage("Record"),
    "tab_record_title" : MessageLookupByLibrary.simpleMessage("All Record"),
    "validation_amount" : MessageLookupByLibrary.simpleMessage("fill amount"),
    "validation_date_notEmpty" : MessageLookupByLibrary.simpleMessage("picker a Date"),
    "validation_event_name" : MessageLookupByLibrary.simpleMessage("fill the Thing"),
    "validation_mobile" : MessageLookupByLibrary.simpleMessage("fill a mobile"),
    "validation_notEmpty" : MessageLookupByLibrary.simpleMessage("should not be empty"),
    "validation_number" : MessageLookupByLibrary.simpleMessage("fill a number"),
    "validation_relation" : MessageLookupByLibrary.simpleMessage("select the relation with the User"),
    "validation_userName" : MessageLookupByLibrary.simpleMessage("fill a Name")
  };
}
