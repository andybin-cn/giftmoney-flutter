

import 'dart:convert';
import 'package:flutter/services.dart';

class NativeUtils {
  static const platform = const MethodChannel('giftmoney_flutter/utils');
  static exportToExcel(String destinationPath, List<List<String>> data) async {
    return await platform.invokeMethod('exportExcel', { 'destinationPath': destinationPath, 'data': data });
  }
  static shareFile({String filePath, String subject}) async {
    return await platform.invokeMethod('shareFile', { 'filePath': filePath, 'subject': subject });
  }
  static openFileManager({String filePath}) async {
    return await platform.invokeMethod('openFileManager', { 'filePath': filePath});
  }
  static Future<List<List<String>>> readExcel({String filePath}) async {
    List<dynamic> result = await platform.invokeMethod('readExcel', { 'filePath': filePath});
    return result.map((row) {
      var list = row as List<dynamic>;
      return list.map((item) {
        return item as String ?? '';
      }).toList();
    }).toList();
  }

  static Future<Map<String, dynamic>> startWebView({String url}) async {
    String jsonString = await platform.invokeMethod('startWebView', { 'url': url});
    Map<String, dynamic> printfinger = JsonDecoder().convert(jsonString);
    return printfinger;
  }
  
}