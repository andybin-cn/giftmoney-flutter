

import 'package:flutter/services.dart';

class NativeUtils {
  static const platform = const MethodChannel('giftmoney_flutter/utils');
  static exportToExcel(String destinationPath, List<List<String>> data) async {
    return await platform.invokeMethod('exportExcel', { "destinationPath": destinationPath, "data": data });
  }
  static shareFile({String filePath, String subject}) async {
    return await platform.invokeMethod('exportExcel', { "filePath": filePath, "subject": subject });
  }
}