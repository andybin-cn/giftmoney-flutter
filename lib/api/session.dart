
import 'package:graphql/client.dart';

import 'cookie_link.dart';

class Session {
  CacheableCookie _cacheableCookie;
  HttpLink _httpLink;
  GraphQLClient _client;
  
  Session() {
    // 初始化
    _cacheableCookie = CacheableCookie();
    
    _httpLink = HttpLink(
      uri: 'https://darling-secret.herokuapp.com/graphql',
    );
    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _cacheableCookie.cookieLink.concat(_httpLink),
    );
  }
  
  initSession() async {
    await _cacheableCookie.initLink();
  }
  bool get isLogin {
    return _cacheableCookie.cookies.containsKey('EGG_SESS');
  }


  Future<Map<String, dynamic>> request({String gqlStr, Map<String, dynamic> variables}) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(gqlStr),
      variables: variables,
    );
    final QueryResult result = await _client.query(options);
    if(result.hasException) {
      throw result.exception;
    } else {
      return result.data;
    }
  }
}