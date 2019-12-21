import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "礼金小助手"
  String get app_name => "礼金小助手";
  /// "记录"
  String get tab_record => "记录";
  /// "统计"
  String get tab_chart => "统计";
  /// "辅助"
  String get tab_accessibility => "辅助";
  /// "我的"
  String get tab_mine => "我的";
  /// "已上传"
  String get bt_upload_success => "已上传";
  /// "未上传"
  String get bt_upload_waiting => "未上传";
  /// "上传失败"
  String get bt_upload_waring => "上传失败";
  /// "正在上传"
  String get bt_upload_uploading => "正在上传";
  /// "保存"
  String get bt_save => "保存";
  /// "姓名"
  String get form_person_name => "姓名";
  /// "关系"
  String get form_relation => "关系";
  /// "事件名称"
  String get form_event_name => "事件名称";
  /// "事件时间"
  String get form_event_time => "事件时间";
  /// "金额"
  String get form_amount => "金额";
  /// "礼物"
  String get form_gift => "礼物";
  /// "类型"
  String get form_type => "类型";
  /// "收份子"
  String get form_in_account => "收份子";
  /// "送份子"
  String get form_out_account => "送份子";
  /// "表单填写不正确"
  String get form_error => "表单填写不正确";
  /// "正在保存"
  String get hud_saving => "正在保存";
  /// "正在加载"
  String get hud_loading => "正在加载";
  /// "保存成功"
  String get hud_save_success => "保存成功";
  /// "分组统计"
  String get statisticsTitle => "分组统计";
  /// "事件"
  String get statisticsEvent_group => "事件";
  /// "关系"
  String get statisticsRelation_group => "关系";
  /// "联系人"
  String get statisticsContact_group => "联系人";
  /// "${count}条记录"
  String statisticsRecordCount(String count) => "${count}条记录";
  /// "${count}个联系人"
  String statisticsContactsCount(String count) => "${count}个联系人";
  /// "不能为空"
  String get validationNotEmpty => "不能为空";
  /// "请填写金额"
  String get validationAmount => "请填写金额";
  /// "请填写数字"
  String get validationNumber => "请填写数字";
  /// "请选择日期"
  String get validationDate_notEmpty => "请选择日期";
  /// "请填写姓名"
  String get validationUserName => "请填写姓名";
  /// "请填写手机号"
  String get validationMobile => "请填写手机号";
  /// "请填写关系"
  String get validationRelation => "请填写关系";
  /// "请填写事件名称"
  String get validationEvent_name => "请填写事件名称";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  /// "GiftMoney"
  @override
  String get app_name => "GiftMoney";
  /// "Record"
  @override
  String get tab_record => "Record";
  /// "Statistics"
  @override
  String get tab_chart => "Statistics";
  /// "Assist"
  @override
  String get tab_accessibility => "Assist";
  /// "Mine"
  @override
  String get tab_mine => "Mine";
  /// "done"
  @override
  String get bt_upload_success => "done";
  /// "waiting"
  @override
  String get bt_upload_waiting => "waiting";
  /// "waring"
  @override
  String get bt_upload_waring => "waring";
  /// "doing"
  @override
  String get bt_upload_uploading => "doing";
  /// "Save"
  @override
  String get bt_save => "Save";
  /// "Name"
  @override
  String get form_person_name => "Name";
  /// "Relation"
  @override
  String get form_relation => "Relation";
  /// "Thing"
  @override
  String get form_event_name => "Thing";
  /// "When"
  @override
  String get form_event_time => "When";
  /// "Amount"
  @override
  String get form_amount => "Amount";
  /// "Gift"
  @override
  String get form_gift => "Gift";
  /// "Money"
  @override
  String get form_type => "Money";
  /// "Income"
  @override
  String get form_in_account => "Income";
  /// "Give away"
  @override
  String get form_out_account => "Give away";
  /// "The form was not filled out correctly"
  @override
  String get form_error => "The form was not filled out correctly";
  /// "Saving"
  @override
  String get hud_saving => "Saving";
  /// "Loading"
  @override
  String get hud_loading => "Loading";
  /// "Success"
  @override
  String get hud_save_success => "Success";
  /// "Grouping statistics"
  @override
  String get statisticsTitle => "Grouping statistics";
  /// "Things"
  @override
  String get statisticsEvent_group => "Things";
  /// "Relations"
  @override
  String get statisticsRelation_group => "Relations";
  /// "Contacts"
  @override
  String get statisticsContact_group => "Contacts";
  /// "${count} Records"
  @override
  String statisticsRecordCount(String count) => "${count} Records";
  /// "${count} Contacts"
  @override
  String statisticsContactsCount(String count) => "${count} Contacts";
  /// "should not be empty"
  @override
  String get validationNotEmpty => "should not be empty";
  /// "fill amount"
  @override
  String get validationAmount => "fill amount";
  /// "fill a number"
  @override
  String get validationNumber => "fill a number";
  /// "picker a Date"
  @override
  String get validationDate_notEmpty => "picker a Date";
  /// "fill a Name"
  @override
  String get validationUserName => "fill a Name";
  /// "fill a mobile"
  @override
  String get validationMobile => "fill a mobile";
  /// "select the relation with the User"
  @override
  String get validationRelation => "select the relation with the User";
  /// "fill the Thing"
  @override
  String get validationEvent_name => "fill the Thing";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_zh_CN extends I18n {
  const _I18n_zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_zh_TW extends _I18n_zh_CN {
  const _I18n_zh_TW();

  /// "禮金小助手"
  @override
  String get app_name => "禮金小助手";
  /// "記錄"
  @override
  String get tab_record => "記錄";
  /// "統計"
  @override
  String get tab_chart => "統計";
  /// "輔助"
  @override
  String get tab_accessibility => "輔助";
  /// "我的"
  @override
  String get tab_mine => "我的";
  /// "已上傳"
  @override
  String get bt_upload_success => "已上傳";
  /// "未上傳"
  @override
  String get bt_upload_waiting => "未上傳";
  /// "上傳失敗"
  @override
  String get bt_upload_waring => "上傳失敗";
  /// "正在上傳"
  @override
  String get bt_upload_uploading => "正在上傳";
  /// "保存"
  @override
  String get bt_save => "保存";
  /// "姓名"
  @override
  String get form_person_name => "姓名";
  /// "關係"
  @override
  String get form_relation => "關係";
  /// "事件名稱"
  @override
  String get form_event_name => "事件名稱";
  /// "事件時間"
  @override
  String get form_event_time => "事件時間";
  /// "金額"
  @override
  String get form_amount => "金額";
  /// "禮物"
  @override
  String get form_gift => "禮物";
  /// "類型"
  @override
  String get form_type => "類型";
  /// "收份子"
  @override
  String get form_in_account => "收份子";
  /// "送份子"
  @override
  String get form_out_account => "送份子";
  /// "正在保存"
  @override
  String get hud_saving => "正在保存";
  /// "正在加載"
  @override
  String get hud_loading => "正在加載";
  /// "保存成功"
  @override
  String get hud_save_success => "保存成功";
  /// "不能為空"
  @override
  String get validationNotEmpty => "不能為空";
  /// "請填寫金額"
  @override
  String get validationAmount => "請填寫金額";
  /// "請填寫數字"
  @override
  String get validationNumber => "請填寫數字";
  /// "請選擇日期"
  @override
  String get validationDate_notEmpty => "請選擇日期";
  /// "請填寫姓名"
  @override
  String get validationUserName => "請填寫姓名";
  /// "請填寫手機號"
  @override
  String get validationMobile => "請填寫手機號";
  /// "請填寫關係"
  @override
  String get validationRelation => "請填寫關係";
  /// "請填寫事件名稱"
  @override
  String get validationEvent_name => "請填寫事件名稱";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_zh_HK extends _I18n_zh_CN {
  const _I18n_zh_HK();

  /// "禮金小助手"
  @override
  String get app_name => "禮金小助手";
  /// "記錄"
  @override
  String get tab_record => "記錄";
  /// "統計"
  @override
  String get tab_chart => "統計";
  /// "輔助"
  @override
  String get tab_accessibility => "輔助";
  /// "我的"
  @override
  String get tab_mine => "我的";
  /// "已上傳"
  @override
  String get bt_upload_success => "已上傳";
  /// "未上傳"
  @override
  String get bt_upload_waiting => "未上傳";
  /// "上傳失敗"
  @override
  String get bt_upload_waring => "上傳失敗";
  /// "正在上傳"
  @override
  String get bt_upload_uploading => "正在上傳";
  /// "保存"
  @override
  String get bt_save => "保存";
  /// "姓名"
  @override
  String get form_person_name => "姓名";
  /// "關係"
  @override
  String get form_relation => "關係";
  /// "事件名稱"
  @override
  String get form_event_name => "事件名稱";
  /// "事件時間"
  @override
  String get form_event_time => "事件時間";
  /// "金額"
  @override
  String get form_amount => "金額";
  /// "禮物"
  @override
  String get form_gift => "禮物";
  /// "類型"
  @override
  String get form_type => "類型";
  /// "收份子"
  @override
  String get form_in_account => "收份子";
  /// "送份子"
  @override
  String get form_out_account => "送份子";
  /// "正在保存"
  @override
  String get hud_saving => "正在保存";
  /// "正在加載"
  @override
  String get hud_loading => "正在加載";
  /// "保存成功"
  @override
  String get hud_save_success => "保存成功";
  /// "不能為空"
  @override
  String get validationNotEmpty => "不能為空";
  /// "請填寫金額"
  @override
  String get validationAmount => "請填寫金額";
  /// "請填寫數字"
  @override
  String get validationNumber => "請填寫數字";
  /// "請選擇日期"
  @override
  String get validationDate_notEmpty => "請選擇日期";
  /// "請填寫姓名"
  @override
  String get validationUserName => "請填寫姓名";
  /// "請填寫手機號"
  @override
  String get validationMobile => "請填寫手機號";
  /// "請填寫關係"
  @override
  String get validationRelation => "請填寫關係";
  /// "請填寫事件名稱"
  @override
  String get validationEvent_name => "請填寫事件名稱";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("zh", "CN"),
      Locale("zh", "TW"),
      Locale("zh", "HK")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("zh_CN" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    }
    else if ("zh_TW" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_TW());
    }
    else if ("zh_HK" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_HK());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("zh" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}