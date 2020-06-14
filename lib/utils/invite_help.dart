

import 'dart:convert';

import 'package:giftmoney/api/api_graphql.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/author_anonymous_req.dart';
import 'package:giftmoney/utils/native_utils.dart';

class InviteHelp {
  static Future<Map<String, dynamic>> fetchMatchedInviteCode(AuthorAnonymousReq author) async {
    var fingerprintStr = await DBManager.instance.keyValue.valueForKey('InviteHelp_fingerprint');
    if(fingerprintStr != null) {
      var inviteInfo = await DBManager.instance.keyValue.valueForKey('InviteHelp_info');
      try {
        return JsonDecoder().convert(inviteInfo);
      } catch(error) {
        return null;
      }
    }
    var fingerprint = await NativeUtils.startWebView(url: "https://darling-secret.herokuapp.com/share/app");
    await DBManager.instance.keyValue.save(key: "InviteHelp_fingerprint", value: jsonEncode(fingerprint));
    var result = await ApiGraphQL.instance.authorAndMatchInviteCode(author, fingerprint);
    await DBManager.instance.keyValue.save(key: "InviteHelp_info", value: jsonEncode(result));
    return result;
  }
}