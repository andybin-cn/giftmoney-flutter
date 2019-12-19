import 'package:giftmoney/utils/i18n_util.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static String dateToString(DateTime date) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
  static String formatCurrency(num number) {
    return NumberFormat.simpleCurrency(locale: I18nUtil.locale.toString()).format(number);
  }
}