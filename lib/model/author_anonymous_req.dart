

import 'package:giftmoney/json_mapper/mappable.dart';

class AuthorAnonymousReq extends Mappable {
  String uuid = null;
  String timestamp = null;
  String accessToken = null;
  
  AuthorAnonymousReq() : super.fromJSON(null);

  AuthorAnonymousReq.fromJSON(Map<String, dynamic> map) : super.fromJSON(map) {
    uuid = transformBasic(map['uuid']);
    timestamp = transformBasic(map['timestamp']);
    accessToken = transformBasic(map['accessToken']);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic> {
      'uuid': uuid,
      'timestamp': timestamp,
      'accessToken': accessToken,
    };
  }
}