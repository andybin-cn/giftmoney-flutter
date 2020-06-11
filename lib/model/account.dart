

import 'package:giftmoney/json_mapper/mappable.dart';

enum AccountType { anonymity, mobile }

class Account extends Mappable {
  String id = null;
  String mobile = null;
  String email = null;
  num coin = 0;
  String token = null;
  String tokenExpiredTime = null;
  AccountType type = AccountType.anonymity;
  
  Account() : super.fromJSON(null);

  Account.fromJSON(Map<String, dynamic> map) : super.fromJSON(map) {
    mobile = transformBasic(map['mobile']);
    email = transformBasic(map['email']);
    coin = transformBasic(map['coin']);
    token = transformBasic(map['token']);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic> {
      'mobile': mobile,
      'email': email,
      'coin': coin,
      'token': token,
    };
  }
}