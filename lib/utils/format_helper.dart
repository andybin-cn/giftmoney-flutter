import 'package:intl/intl.dart';

class FormatHelper {
  static String dateToString(DateTime date) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}