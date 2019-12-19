

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/pages/events_statistics_page.dart';
import 'package:giftmoney/pages/home_record_page.dart';

class HomeChartPage extends BaseStatefulPage {
  HomeChartPage({Key key}) : super(key: key);

  _HomeChartPageState createState() => _HomeChartPageState();
}

class _HomeChartPageState extends BasePageState<HomeChartPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildContainer(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(i18n.statisticsTitle),
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: <Widget>[
            Text(i18n.statisticsEvent_group),
            Text(i18n.statisticsRelation_group),
            Text(i18n.statisticsContact_group),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          EventsStatisticsPage(),
          HomeRecordPage(),
          Text("3"),
        ],
      ),
    );
  }
}