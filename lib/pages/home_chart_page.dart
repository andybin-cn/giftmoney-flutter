

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/pages/contacts_statistics_page.dart';
import 'package:giftmoney/pages/events_statistics_page.dart';
import 'package:giftmoney/pages/relations_statistics_page.dart';

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
        bottom: MyTabBar(
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
          RelationsStatisticsPage(),
          ContactsStatisticsPage(),
        ],
      ),
    );
  }
}

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isScrollable;
  final TabController controller;
  final List<Widget> tabs;

  MyTabBar({Key key, this.controller, this.isScrollable, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(isScrollable: isScrollable, controller: controller, tabs: tabs);
  }

  @override
  Size get preferredSize => Size.fromHeight(20);
}