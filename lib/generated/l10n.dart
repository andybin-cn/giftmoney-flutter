// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `礼金小助手`
  String get app_name {
    return Intl.message(
      '礼金小助手',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `记录`
  String get tab_record {
    return Intl.message(
      '记录',
      name: 'tab_record',
      desc: '',
      args: [],
    );
  }

  /// `所有记录`
  String get tab_record_title {
    return Intl.message(
      '所有记录',
      name: 'tab_record_title',
      desc: '',
      args: [],
    );
  }

  /// `统计`
  String get tab_chart {
    return Intl.message(
      '统计',
      name: 'tab_chart',
      desc: '',
      args: [],
    );
  }

  /// `辅助`
  String get tab_accessibility {
    return Intl.message(
      '辅助',
      name: 'tab_accessibility',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get tab_mine {
    return Intl.message(
      '我的',
      name: 'tab_mine',
      desc: '',
      args: [],
    );
  }

  /// `导出至Excel`
  String get accessibility_exoprt_button {
    return Intl.message(
      '导出至Excel',
      name: 'accessibility_exoprt_button',
      desc: '',
      args: [],
    );
  }

  /// `从Excel导入数据`
  String get accessibility_import_button {
    return Intl.message(
      '从Excel导入数据',
      name: 'accessibility_import_button',
      desc: '',
      args: [],
    );
  }

  /// `历史记录（导出数据）`
  String get accessibility_history_button {
    return Intl.message(
      '历史记录（导出数据）',
      name: 'accessibility_history_button',
      desc: '',
      args: [],
    );
  }

  /// `推荐给好友（赚金币）`
  String get mine_invite {
    return Intl.message(
      '推荐给好友（赚金币）',
      name: 'mine_invite',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get mine_setting {
    return Intl.message(
      '设置',
      name: 'mine_setting',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get mine_about {
    return Intl.message(
      '关于我们',
      name: 'mine_about',
      desc: '',
      args: [],
    );
  }

  /// `《隐私政策》与《用户协议》`
  String get mine_privacy {
    return Intl.message(
      '《隐私政策》与《用户协议》',
      name: 'mine_privacy',
      desc: '',
      args: [],
    );
  }

  /// `金币使用规则`
  String get mine_coin_rules {
    return Intl.message(
      '金币使用规则',
      name: 'mine_coin_rules',
      desc: '',
      args: [],
    );
  }

  /// `意见反馈`
  String get mine_feedback {
    return Intl.message(
      '意见反馈',
      name: 'mine_feedback',
      desc: '',
      args: [],
    );
  }

  /// `版本：{version}`
  String mine_appVersion(Object version) {
    return Intl.message(
      '版本：$version',
      name: 'mine_appVersion',
      desc: '',
      args: [version],
    );
  }

  /// `1.我们是个人开发爱好者，希望我们的App能够帮助你解决一些实际问题，给你的生活带来便利。\n\n2.我们会对你的数据进行加密保护，可以放心使用。\n\n\n\n如遇到任何问题，请发送邮件至：reciprocityApp@163.com\n我们会尽快与您联系`
  String get mine_appDescription {
    return Intl.message(
      '1.我们是个人开发爱好者，希望我们的App能够帮助你解决一些实际问题，给你的生活带来便利。\n\n2.我们会对你的数据进行加密保护，可以放心使用。\n\n\n\n如遇到任何问题，请发送邮件至：reciprocityApp@163.com\n我们会尽快与您联系',
      name: 'mine_appDescription',
      desc: '',
      args: [],
    );
  }

  /// `朋友圈`
  String get share_wechatTimeline {
    return Intl.message(
      '朋友圈',
      name: 'share_wechatTimeline',
      desc: '',
      args: [],
    );
  }

  /// `QQ空间`
  String get share_qZone {
    return Intl.message(
      'QQ空间',
      name: 'share_qZone',
      desc: '',
      args: [],
    );
  }

  /// `新浪微博`
  String get share_sina {
    return Intl.message(
      '新浪微博',
      name: 'share_sina',
      desc: '',
      args: [],
    );
  }

  /// `豆瓣`
  String get share_douBan {
    return Intl.message(
      '豆瓣',
      name: 'share_douBan',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get share_facebook {
    return Intl.message(
      'Facebook',
      name: 'share_facebook',
      desc: '',
      args: [],
    );
  }

  /// `推特`
  String get share_twitter {
    return Intl.message(
      '推特',
      name: 'share_twitter',
      desc: '',
      args: [],
    );
  }

  /// `QQ好友`
  String get share_qq {
    return Intl.message(
      'QQ好友',
      name: 'share_qq',
      desc: '',
      args: [],
    );
  }

  /// `微信好友`
  String get share_wechat {
    return Intl.message(
      '微信好友',
      name: 'share_wechat',
      desc: '',
      args: [],
    );
  }

  /// `其他`
  String get share_other {
    return Intl.message(
      '其他',
      name: 'share_other',
      desc: '',
      args: [],
    );
  }

  /// `已上传`
  String get bt_upload_success {
    return Intl.message(
      '已上传',
      name: 'bt_upload_success',
      desc: '',
      args: [],
    );
  }

  /// `未上传`
  String get bt_upload_waiting {
    return Intl.message(
      '未上传',
      name: 'bt_upload_waiting',
      desc: '',
      args: [],
    );
  }

  /// `上传失败`
  String get bt_upload_waring {
    return Intl.message(
      '上传失败',
      name: 'bt_upload_waring',
      desc: '',
      args: [],
    );
  }

  /// `正在上传`
  String get bt_upload_uploading {
    return Intl.message(
      '正在上传',
      name: 'bt_upload_uploading',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get bt_save {
    return Intl.message(
      '保存',
      name: 'bt_save',
      desc: '',
      args: [],
    );
  }

  /// `删除`
  String get bt_delete {
    return Intl.message(
      '删除',
      name: 'bt_delete',
      desc: '',
      args: [],
    );
  }

  /// `姓名`
  String get form_person_name {
    return Intl.message(
      '姓名',
      name: 'form_person_name',
      desc: '',
      args: [],
    );
  }

  /// `关系`
  String get form_relation {
    return Intl.message(
      '关系',
      name: 'form_relation',
      desc: '',
      args: [],
    );
  }

  /// `事件名称`
  String get form_event_name {
    return Intl.message(
      '事件名称',
      name: 'form_event_name',
      desc: '',
      args: [],
    );
  }

  /// `事件时间`
  String get form_event_time {
    return Intl.message(
      '事件时间',
      name: 'form_event_time',
      desc: '',
      args: [],
    );
  }

  /// `金额`
  String get form_amount {
    return Intl.message(
      '金额',
      name: 'form_amount',
      desc: '',
      args: [],
    );
  }

  /// `礼物`
  String get form_gift {
    return Intl.message(
      '礼物',
      name: 'form_gift',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get form_type {
    return Intl.message(
      '类型',
      name: 'form_type',
      desc: '',
      args: [],
    );
  }

  /// `收份子`
  String get form_in_account {
    return Intl.message(
      '收份子',
      name: 'form_in_account',
      desc: '',
      args: [],
    );
  }

  /// `送份子`
  String get form_out_account {
    return Intl.message(
      '送份子',
      name: 'form_out_account',
      desc: '',
      args: [],
    );
  }

  /// `表单填写不正确`
  String get form_error {
    return Intl.message(
      '表单填写不正确',
      name: 'form_error',
      desc: '',
      args: [],
    );
  }

  /// `正在保存`
  String get hud_saving {
    return Intl.message(
      '正在保存',
      name: 'hud_saving',
      desc: '',
      args: [],
    );
  }

  /// `正在加载`
  String get hud_loading {
    return Intl.message(
      '正在加载',
      name: 'hud_loading',
      desc: '',
      args: [],
    );
  }

  /// `保存成功`
  String get hud_save_success {
    return Intl.message(
      '保存成功',
      name: 'hud_save_success',
      desc: '',
      args: [],
    );
  }

  /// `好的`
  String get alert_ok_button {
    return Intl.message(
      '好的',
      name: 'alert_ok_button',
      desc: '',
      args: [],
    );
  }

  /// `导入完成`
  String get alert_import_result_title {
    return Intl.message(
      '导入完成',
      name: 'alert_import_result_title',
      desc: '',
      args: [],
    );
  }

  /// `成功: {success} 条记录\n忽略: {skipped} 条记录\n失败: {failed} 条记录`
  String alert_import_result(Object success, Object skipped, Object failed) {
    return Intl.message(
      '成功: $success 条记录\n忽略: $skipped 条记录\n失败: $failed 条记录',
      name: 'alert_import_result',
      desc: '',
      args: [success, skipped, failed],
    );
  }

  /// `分组统计`
  String get statistics_title {
    return Intl.message(
      '分组统计',
      name: 'statistics_title',
      desc: '',
      args: [],
    );
  }

  /// `事件`
  String get statistics_event_group {
    return Intl.message(
      '事件',
      name: 'statistics_event_group',
      desc: '',
      args: [],
    );
  }

  /// `关系`
  String get statistics_relation_group {
    return Intl.message(
      '关系',
      name: 'statistics_relation_group',
      desc: '',
      args: [],
    );
  }

  /// `联系人`
  String get statistics_contact_group {
    return Intl.message(
      '联系人',
      name: 'statistics_contact_group',
      desc: '',
      args: [],
    );
  }

  /// `{count}条记录`
  String statistics_recordCount(Object count) {
    return Intl.message(
      '$count条记录',
      name: 'statistics_recordCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count}个联系人`
  String statistics_contactsCount(Object count) {
    return Intl.message(
      '$count个联系人',
      name: 'statistics_contactsCount',
      desc: '',
      args: [count],
    );
  }

  /// `不能为空`
  String get validation_notEmpty {
    return Intl.message(
      '不能为空',
      name: 'validation_notEmpty',
      desc: '',
      args: [],
    );
  }

  /// `请填写金额`
  String get validation_amount {
    return Intl.message(
      '请填写金额',
      name: 'validation_amount',
      desc: '',
      args: [],
    );
  }

  /// `请填写数字`
  String get validation_number {
    return Intl.message(
      '请填写数字',
      name: 'validation_number',
      desc: '',
      args: [],
    );
  }

  /// `请选择日期`
  String get validation_date_notEmpty {
    return Intl.message(
      '请选择日期',
      name: 'validation_date_notEmpty',
      desc: '',
      args: [],
    );
  }

  /// `请填写姓名`
  String get validation_userName {
    return Intl.message(
      '请填写姓名',
      name: 'validation_userName',
      desc: '',
      args: [],
    );
  }

  /// `请填写手机号`
  String get validation_mobile {
    return Intl.message(
      '请填写手机号',
      name: 'validation_mobile',
      desc: '',
      args: [],
    );
  }

  /// `请填写关系`
  String get validation_relation {
    return Intl.message(
      '请填写关系',
      name: 'validation_relation',
      desc: '',
      args: [],
    );
  }

  /// `请填写事件名称`
  String get validation_event_name {
    return Intl.message(
      '请填写事件名称',
      name: 'validation_event_name',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get excel_header_id {
    return Intl.message(
      'ID',
      name: 'excel_header_id',
      desc: '',
      args: [],
    );
  }

  /// `事件ID`
  String get excel_header_eventID {
    return Intl.message(
      '事件ID',
      name: 'excel_header_eventID',
      desc: '',
      args: [],
    );
  }

  /// `关系ID`
  String get excel_header_relationID {
    return Intl.message(
      '关系ID',
      name: 'excel_header_relationID',
      desc: '',
      args: [],
    );
  }

  /// `人物ID`
  String get excel_header_personID {
    return Intl.message(
      '人物ID',
      name: 'excel_header_personID',
      desc: '',
      args: [],
    );
  }

  /// `创建时间`
  String get excel_header_createAt {
    return Intl.message(
      '创建时间',
      name: 'excel_header_createAt',
      desc: '',
      args: [],
    );
  }

  /// `修改时间`
  String get excel_header_updateAt {
    return Intl.message(
      '修改时间',
      name: 'excel_header_updateAt',
      desc: '',
      args: [],
    );
  }

  /// `事件名称`
  String get excel_header_eventName {
    return Intl.message(
      '事件名称',
      name: 'excel_header_eventName',
      desc: '',
      args: [],
    );
  }

  /// `事件时间`
  String get excel_header_eventTime {
    return Intl.message(
      '事件时间',
      name: 'excel_header_eventTime',
      desc: '',
      args: [],
    );
  }

  /// `关系`
  String get excel_header_relationName {
    return Intl.message(
      '关系',
      name: 'excel_header_relationName',
      desc: '',
      args: [],
    );
  }

  /// `姓名`
  String get excel_header_personName {
    return Intl.message(
      '姓名',
      name: 'excel_header_personName',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get excel_header_type {
    return Intl.message(
      '类型',
      name: 'excel_header_type',
      desc: '',
      args: [],
    );
  }

  /// `数据类型`
  String get excel_header_valueType {
    return Intl.message(
      '数据类型',
      name: 'excel_header_valueType',
      desc: '',
      args: [],
    );
  }

  /// `金额`
  String get excel_header_value {
    return Intl.message(
      '金额',
      name: 'excel_header_value',
      desc: '',
      args: [],
    );
  }

  /// `礼物名称`
  String get excel_header_giftName {
    return Intl.message(
      '礼物名称',
      name: 'excel_header_giftName',
      desc: '',
      args: [],
    );
  }

  /// `单位`
  String get excel_header_unit {
    return Intl.message(
      '单位',
      name: 'excel_header_unit',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get excel_header_remark {
    return Intl.message(
      '备注',
      name: 'excel_header_remark',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}