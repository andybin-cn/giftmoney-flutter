

import 'dart:convert';

import 'package:giftmoney/api/api_graphql.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/utils/native_utils.dart';

class InviteHelp {
  static Future<Map<String, dynamic>> fetchMatchedInviteCode() async {
    var inviteInfo = await DBManager.instance.keyValue.valueForKey('InviteHelp_info');
    if(inviteInfo != null) {
      try {
        return JsonDecoder().convert(inviteInfo);
      } catch(error) {
        return null;
      }
    }
    var fingerprint = await NativeUtils.startWebView(url: "https://darling-secret.herokuapp.com/share/app");
    await DBManager.instance.keyValue.save(key: "InviteHelp_fingerprint", value: jsonEncode(fingerprint));
    fingerprint['inviteCode'] = '';
    var result = await ApiGraphQL.instance.matchInviteCode(fingerprint);
    await DBManager.instance.keyValue.save(key: "InviteHelp_info", value: jsonEncode(result));
    return result;
  }
}