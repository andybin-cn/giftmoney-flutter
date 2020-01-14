

import 'package:package_info/package_info.dart';

class Constant {
  static PackageInfo packageInfo;
  static init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}