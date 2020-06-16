import 'dart:async';

import 'package:giftmoney/data_center/db_manager.dart';
import 'package:http/http.dart';
import 'package:graphql/src/link/link.dart';
import 'package:graphql/src/link/operation.dart';
import 'package:graphql/src/link/fetch_result.dart';


class CacheableCookie {
  Link cookieLink;
  Map<String, String> cookies = {};
  
  CacheableCookie() {
    cookieLink = Link(request: (operation, [forward]) {
      StreamController<FetchResult> controller;
      Future<void> onListen() async {
        try {
          operation.setContext(<String, Map<String, String>>{
            'headers': <String, String>{'Cookie': this.cookieString}
          });
        } catch (error) {
          controller.addError(error);
        }

        await controller.addStream(forward(operation));
        StreamedResponse resp = operation.getContext()['response'];
        var cookie = resp.headers['set-cookie'];
        parseCookie(cookie);
        await controller.close();
        await saveCookie();
      }
      controller = StreamController<FetchResult>(onListen: onListen);

      return controller.stream;
    });
  }
  
  initLink() async {
    var cookie = await DBManager.instance.keyValue.valueForKey('CacheableCookie_cookies') ?? '';
    parseCookie(cookie);
  }
  parseCookie(String cookie) {
    if(cookie == null) {
      return;
    }
    var cookies = cookie.split(';');
    cookies.forEach((element) {
      var firstSpilIndex = element.indexOf('=');
      if(firstSpilIndex <= 0 || firstSpilIndex >= element.length - 1) {
        return;
      }
      var name = element.substring(0, firstSpilIndex).trim();
      var value = element.substring(firstSpilIndex+1).trim();
      if(name == 'expires'
        || name == 'samesite'
        || name == 'path'
      ) {
        return;
      }
      this.cookies[name] = value;
    });
  }
  String get cookieString {
    var str = '';
    cookies.forEach((key, value) {
      str += '${key}=${value}; ';
    });
    return str;
  }
  saveCookie() async {
    if(cookies['EGG_SESS'] == null) {
      return;
    }
    var session_str = 'EGG_SESS=${cookies['EGG_SESS']}; ';
    await DBManager.instance.keyValue.save(key: 'CacheableCookie_cookies', value: session_str);
  }
}


class CookieLink extends Link {
  String cookie = '';

  CookieLink({
    this.cookie,
  }) : super(
          request: (Operation operation, [NextLink forward]) {
            StreamController<FetchResult> controller;

            Future<void> onListen() async {
              try {
                operation.setContext(<String, Map<String, String>>{
                  'headers': <String, String>{'Cookie': cookie}
                });
              } catch (error) {
                controller.addError(error);
              }

              await controller.addStream(forward(operation));
              StreamedResponse resp = operation.getContext()['response'];
              // this.cookie = resp.headers['set-cookie'];
              await controller.close();
            }

            controller = StreamController<FetchResult>(onListen: onListen);

            return controller.stream;
          },
        );

  _onListen(Operation operation, [NextLink forward]) {
    StreamController<FetchResult> controller;

    Future<void> onListen() async {
      try {
        operation.setContext(<String, Map<String, String>>{
          'headers': <String, String>{'Cookie': cookie}
        });
      } catch (error) {
        controller.addError(error);
      }

      await controller.addStream(forward(operation));
      StreamedResponse resp = operation.getContext()['response'];
      this.cookie = resp.headers['set-cookie'];
      await controller.close();
    }

    controller = StreamController<FetchResult>(onListen: onListen);

    return controller.stream;
  }
}
