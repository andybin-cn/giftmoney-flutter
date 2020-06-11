import 'package:giftmoney/model/account.dart';
import 'package:giftmoney/utils/CommonError.dart';
import 'package:graphql/client.dart';

class ApiGraphQL {
  // 工厂模式
  factory ApiGraphQL() => _getInstance();
  static ApiGraphQL get instance => _getInstance();
  static ApiGraphQL _instance;
  ApiGraphQL._internal() {
    // 初始化
    final HttpLink _httpLink = HttpLink(
      uri: 'https://darling-secret.herokuapp.com/graphql',
    );
    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );
  }
  static ApiGraphQL _getInstance() {
    if (_instance == null) {
      _instance = new ApiGraphQL._internal();
    }
    return _instance;
  }

  GraphQLClient _client;

  Future<Account> login({String mobile, String password}) async {
    //todo
  }

  Future<Account> loginAnonymity() async {
    
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
    const String queryQL = r'''
      query matchInviteCode($fingerprint: ShareFingerprint!) {
        matchInviteCode(fingerprint: $fingerprint) {
          id
          inviteCode
        }
      }
    ''';
    fingerprint["inviteCode"] = "";
    final QueryOptions options = QueryOptions(
      documentNode: gql(queryQL),
      variables: { 'fingerprint': fingerprint },
    );
    final QueryResult result = await _client.query(options);
    if(result.hasException) {
      throw result.exception;
    } else {
      return result.data;
    }
  }
}
