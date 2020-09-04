// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans_CN locale. All the
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
  String get localeName => 'zh_Hans_CN';

  static m0(success, skipped, failed) => "成功: ${success} 条记录\n忽略: ${skipped} 条记录\n失败: ${failed} 条记录";

  static m1(version) => "版本：${version}";

  static m2(count) => "${count}个联系人";

  static m3(count) => "${count}条记录";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accessibility_exoprt_button" : MessageLookupByLibrary.simpleMessage("导出至Excel"),
    "accessibility_history_button" : MessageLookupByLibrary.simpleMessage("历史记录（导出数据）"),
    "accessibility_import_button" : MessageLookupByLibrary.simpleMessage("从Excel导入数据"),
    "alert_import_result" : m0,
    "alert_import_result_title" : MessageLookupByLibrary.simpleMessage("导入完成"),
    "alert_ok_button" : MessageLookupByLibrary.simpleMessage("好的"),
    "app_name" : MessageLookupByLibrary.simpleMessage("礼金小助手"),
    "bt_delete" : MessageLookupByLibrary.simpleMessage("删除"),
    "bt_save" : MessageLookupByLibrary.simpleMessage("保存"),
    "bt_upload_success" : MessageLookupByLibrary.simpleMessage("已上传"),
    "bt_upload_uploading" : MessageLookupByLibrary.simpleMessage("正在上传"),
    "bt_upload_waiting" : MessageLookupByLibrary.simpleMessage("未上传"),
    "bt_upload_waring" : MessageLookupByLibrary.simpleMessage("上传失败"),
    "excel_header_createAt" : MessageLookupByLibrary.simpleMessage("创建时间"),
    "excel_header_eventID" : MessageLookupByLibrary.simpleMessage("事件ID"),
    "excel_header_eventName" : MessageLookupByLibrary.simpleMessage("事件名称"),
    "excel_header_eventTime" : MessageLookupByLibrary.simpleMessage("事件时间"),
    "excel_header_giftName" : MessageLookupByLibrary.simpleMessage("礼物名称"),
    "excel_header_id" : MessageLookupByLibrary.simpleMessage("ID"),
    "excel_header_personID" : MessageLookupByLibrary.simpleMessage("人物ID"),
    "excel_header_personName" : MessageLookupByLibrary.simpleMessage("姓名"),
    "excel_header_relationID" : MessageLookupByLibrary.simpleMessage("关系ID"),
    "excel_header_relationName" : MessageLookupByLibrary.simpleMessage("关系"),
    "excel_header_remark" : MessageLookupByLibrary.simpleMessage("备注"),
    "excel_header_type" : MessageLookupByLibrary.simpleMessage("类型"),
    "excel_header_unit" : MessageLookupByLibrary.simpleMessage("单位"),
    "excel_header_updateAt" : MessageLookupByLibrary.simpleMessage("修改时间"),
    "excel_header_value" : MessageLookupByLibrary.simpleMessage("金额"),
    "excel_header_valueType" : MessageLookupByLibrary.simpleMessage("数据类型"),
    "form_amount" : MessageLookupByLibrary.simpleMessage("金额"),
    "form_error" : MessageLookupByLibrary.simpleMessage("表单填写不正确"),
    "form_event_name" : MessageLookupByLibrary.simpleMessage("事件名称"),
    "form_event_time" : MessageLookupByLibrary.simpleMessage("事件时间"),
    "form_gift" : MessageLookupByLibrary.simpleMessage("礼物"),
    "form_in_account" : MessageLookupByLibrary.simpleMessage("收份子"),
    "form_out_account" : MessageLookupByLibrary.simpleMessage("送份子"),
    "form_person_name" : MessageLookupByLibrary.simpleMessage("姓名"),
    "form_relation" : MessageLookupByLibrary.simpleMessage("关系"),
    "form_type" : MessageLookupByLibrary.simpleMessage("类型"),
    "hud_loading" : MessageLookupByLibrary.simpleMessage("正在加载"),
    "hud_save_success" : MessageLookupByLibrary.simpleMessage("保存成功"),
    "hud_saving" : MessageLookupByLibrary.simpleMessage("正在保存"),
    "mine_about" : MessageLookupByLibrary.simpleMessage("关于我们"),
    "mine_appDescription" : MessageLookupByLibrary.simpleMessage("1.我们是个人开发爱好者，希望我们的App能够帮助你解决一些实际问题，给你的生活带来便利。\n\n2.数据完全保存在本地，对数据进行了严格的加密保护，保证数据的安全可靠！\n\n\n\n如遇到任何问题，请发送邮件至：reciprocityApp@163.com\n我们会尽快与您联系"),
    "mine_appVersion" : m1,
    "mine_coin_rules" : MessageLookupByLibrary.simpleMessage("金币使用规则"),
    "mine_feedback" : MessageLookupByLibrary.simpleMessage("意见反馈"),
    "mine_invite" : MessageLookupByLibrary.simpleMessage("推荐给好友（赚金币）"),
    "mine_privacy" : MessageLookupByLibrary.simpleMessage("《隐私政策》与《用户协议》"),
    "mine_setting" : MessageLookupByLibrary.simpleMessage("设置"),
    "share_douBan" : MessageLookupByLibrary.simpleMessage("豆瓣"),
    "share_facebook" : MessageLookupByLibrary.simpleMessage("Facebook"),
    "share_other" : MessageLookupByLibrary.simpleMessage("其他"),
    "share_qZone" : MessageLookupByLibrary.simpleMessage("QQ空间"),
    "share_qq" : MessageLookupByLibrary.simpleMessage("QQ好友"),
    "share_sina" : MessageLookupByLibrary.simpleMessage("新浪微博"),
    "share_twitter" : MessageLookupByLibrary.simpleMessage("推特"),
    "share_wechat" : MessageLookupByLibrary.simpleMessage("微信好友"),
    "share_wechatTimeline" : MessageLookupByLibrary.simpleMessage("朋友圈"),
    "statistics_contact_group" : MessageLookupByLibrary.simpleMessage("联系人"),
    "statistics_contactsCount" : m2,
    "statistics_event_group" : MessageLookupByLibrary.simpleMessage("事件"),
    "statistics_recordCount" : m3,
    "statistics_relation_group" : MessageLookupByLibrary.simpleMessage("关系"),
    "statistics_title" : MessageLookupByLibrary.simpleMessage("分组统计"),
    "tab_accessibility" : MessageLookupByLibrary.simpleMessage("辅助"),
    "tab_chart" : MessageLookupByLibrary.simpleMessage("统计"),
    "tab_mine" : MessageLookupByLibrary.simpleMessage("我的"),
    "tab_record" : MessageLookupByLibrary.simpleMessage("记录"),
    "tab_record_title" : MessageLookupByLibrary.simpleMessage("所有记录"),
    "validation_amount" : MessageLookupByLibrary.simpleMessage("请填写金额"),
    "validation_date_notEmpty" : MessageLookupByLibrary.simpleMessage("请选择日期"),
    "validation_event_name" : MessageLookupByLibrary.simpleMessage("请填写事件名称"),
    "validation_mobile" : MessageLookupByLibrary.simpleMessage("请填写手机号"),
    "validation_notEmpty" : MessageLookupByLibrary.simpleMessage("不能为空"),
    "validation_number" : MessageLookupByLibrary.simpleMessage("请填写数字"),
    "validation_relation" : MessageLookupByLibrary.simpleMessage("请填写关系"),
    "validation_userName" : MessageLookupByLibrary.simpleMessage("请填写姓名")
  };
}
