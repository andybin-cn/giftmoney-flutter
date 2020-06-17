import 'package:flutter/widgets.dart' show FormFieldValidator;
import 'package:giftmoney/utils/i18n_util.dart';

typedef FormFieldValidator<T> Validator<T>(T input);

class Validation {
  static final _rules = {
    'not_empty': r'\S+',
    'string': r'\S+',
    'number': r'^\d+$',
    'name': r'^[a-zA-Z0-9. ]{1,32}$',
    'nik': r'^\d{6}[0-7][0-9][0-1][0-9]\d{2}\d{4}$',
    'mobile': r'^(?:0|\+?62)?(8\d{7,11})$',
    'telephone': r'^\d{2,5}-\d{5,10}$',
    'password': r'^[\x00-\xff]+$',
    'number_password': r'^\d{6}$',
    'email': r'^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,3}$',
    'bank_account': r'^[\d ]{6,32}$',
    'postcode': r'^\d{5}$',
    'salary': r'^Rp [\d.]{7,12}$',
  };

  static bool validate(String input, String rule) {
    if (rule != null && rule.isNotEmpty && _rules[rule] != null) {
      RegExp regExp = new RegExp(_rules[rule]);
      return regExp.hasMatch(input);
    }
    return true;
  }


  static FormFieldValidator<String> validator({String rule, String errorMsg, FormFieldValidator<String> validator}) {
    if(validator != null) {
      return validator;
    }
    FormFieldValidator<String> func = (input) {
      if(Validation.validate(input, rule)) {
        return null;
      } else {
        return errorMsg;
      }
    };
    return func;
  }



  static FormFieldValidator<String> get notEmpty {
    return Validation.validator(rule: 'not_empty', errorMsg: I18nUtil.shared.validation_notEmpty);
  }
  static FormFieldValidator<DateTime> get date_notEmpty {
    var validatorString = Validation.validator(rule: 'not_empty', errorMsg: I18nUtil.shared.validation_date_notEmpty);
    return (input) => validatorString(input.toString());
  }
  static FormFieldValidator<String> get userName {
    return Validation.validator(rule: 'not_empty', errorMsg: I18nUtil.shared.validation_userName);
  }
  static FormFieldValidator<String> get mobile {
    return Validation.validator(rule: 'mobile', errorMsg: I18nUtil.shared.validation_mobile);
  }
  static FormFieldValidator<String> get amount {
    return Validation.validator(rule: 'number', errorMsg: I18nUtil.shared.validation_amount);
  }
  static FormFieldValidator<String> get relation {
    return Validation.validator(rule: 'not_empty', errorMsg: I18nUtil.shared.validation_relation);
  }
  static FormFieldValidator<String> get eventName {
    return Validation.validator(rule: 'not_empty', errorMsg: I18nUtil.shared.validation_event_name);
  }
}
