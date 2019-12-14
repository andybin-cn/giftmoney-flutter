import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';

class HomeAccessibilityPage extends BaseStatefulPage {
  HomeAccessibilityPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomeAccessibilityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("HomeAccessibilityPage"),
    );
  }
}