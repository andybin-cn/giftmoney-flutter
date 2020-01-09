import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/event_cell.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/pages/event_record_page.dart';
import 'package:giftmoney/service/trade_service.dart';

class EventsStatisticsPage extends BaseStatefulPage {
  EventsStatisticsPage({Key key}) : super(key: key);

  @override
  _EventsStatisticsPageState createState() => _EventsStatisticsPageState();
}

class _EventsStatisticsPageState extends BasePageState<EventsStatisticsPage> with AutomaticKeepAliveClientMixin {
  List<SQLEvent> events = List<SQLEvent>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    TradeService.instance.tradeStream.stream.listen((event) {
      _refreshKey.currentState.show();
    });
    Timer(Duration(milliseconds: 100), () => _refreshKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh,
      child: ListView.separated(
        // physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0.5),
        itemBuilder: _renderRow,
        itemCount: events.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(title: EventCell(event: events[index]), onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return EventRecordPage(event: events[index]);
        })
      );
    });
  }

  Future<Null> _onRefresh() async {
    var events = await TradeService.instance.queryTradeGroupByEvent();
    setState(() {
      this.events = events;
    });
  }

  @override
  bool get wantKeepAlive => true;
}