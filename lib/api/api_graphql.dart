import 'package:giftmoney/api/graphql_constant.dart';
import 'package:giftmoney/api/session.dart';
import 'package:giftmoney/model/account.dart';
import 'package:giftmoney/model/author_anonymous_req.dart';

class ApiGraphQL {
  // 工厂模式
  factory ApiGraphQL() => _getInstance();
  static ApiGraphQL get instance => _getInstance();
  static ApiGraphQL _instance;
  ApiGraphQL._internal() {
    session = Session();
  }
  static ApiGraphQL _getInstance() {
    if (_instance == null) {
      _instance = new ApiGraphQL._internal();
    }
    return _instance;
  }

  Session session;

  Future<Account> login({String mobile, String password}) async {
    //todo
  }
  
  Future<Map<String, dynamic>> loginAnonymity(AuthorAnonymousReq author) async {
    return session.request(gqlStr: GraphqlConstant.loginQL, variables: { 
      'author': {
        'uuid': author.uuid,
        'timestamp': author.timestamp,
        'accessToken': author.accessToken
      }
    });
  }

  Future<Account> refreshAccount(Account account) async {
    
  }

// String opToken	运营商token
// String token	服务器token
// String operator	运营商类型，[CMCC:中国移动，CUCC：中国联通，CTCC：中国电信]
  Future<Account> bindingMobile({String opToken, String token, String opName}) async {
    //todo
  }

  Future<Map<String, dynamic>> matchInviteCode(Map<String, dynamic> fingerprint) async {
    return session.request(gqlStr: GraphqlConstant.matchInviteCodeQL, variables: { 'fingerprint': fingerprint });
  }
}
