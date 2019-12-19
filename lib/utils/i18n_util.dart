import 'package:flutter/widgets.dart';
import 'package:giftmoney/generated/i18n.dart';

class I18nUtil {
  static I18n shared;
  static Locale locale;
  static setContext(BuildContext context) {
    shared = I18n.of(context);
    locale = Localizations.localeOf(context);
  }
}