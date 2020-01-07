import 'package:giftmoney/utils/i18n_util.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static String dateToString(DateTime date) {
    if(date == null) {
      return "";
    }
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
  static String datetimeToString(DateTime date) {
    if(date == null) {
      return "";
    }
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(date);
  }

  static String formatSize(int size) {
    if(size == null) {
      return "";
    }
    var units = ["B", "KB", "MB", "GB", "TB"];
    var value = size.toDouble();
    var index = 0;
    while (value >= 1024 && index < units.length - 1) {
      value = value / 1024;
      index += 1;
    }
    return "${value.toStringAsFixed(2)} ${units[index]}";
  }
  static String formatCurrency(num number) {
    return NumberFormat.simpleCurrency(locale: I18nUtil.locale.toString()).format(number);
  }
}