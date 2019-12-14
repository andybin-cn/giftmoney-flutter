

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';

class HomeChartPage extends BaseStatefulPage {
  HomeChartPage({Key key}) : super(key: key);

  _HomeChartPageState createState() => _HomeChartPageState();
}

class _HomeChartPageState extends BasePageState<HomeChartPage> {
  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: Text("Chart"),
    );
  }
}