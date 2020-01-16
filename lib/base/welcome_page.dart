import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';

class WelcomePage extends BaseStatefulPage {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends BasePageState<WelcomePage> {
  @override
  Widget buildBody(BuildContext context) {
    return Container();
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     SizedBox(
    //       height: 50,
    //       width: 50,
    //       child: CircularProgressIndicator(),
    //     )
    //   ],
    // );
  }
}
