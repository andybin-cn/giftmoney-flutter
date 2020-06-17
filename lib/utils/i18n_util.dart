import 'package:flutter/widgets.dart';
import 'package:giftmoney/generated/l10n.dart';

class I18nUtil {
  static S shared;
  static Locale locale;
  static setContext(BuildContext context) {
    shared = S.of(context);
    locale = Localizations.localeOf(context);
  }
  
  static S of(BuildContext context) {
    return S.of(context);
  }
}