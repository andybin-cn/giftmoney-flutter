

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/trade_cell.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/trade_service.dart';

import 'add_record_page.dart';

class EventRecordPage extends BaseStatefulPage {
  final SQLEvent event;
  EventRecordPage({Key key, @required this.event}) : super(key: key);

  _EventRecordPageState createState() => _EventRecordPageState();
}

class _EventRecordPageState extends BasePageState<EventRecordPage> {
  List<SQLTrade> trades = List<SQLTrade>();
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
  Widget buildSelfScrollBody(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh,
      child: ListView.separated(
        // physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: _renderRow,
        itemCount: trades.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(title: TradeCell(trade: trades[index]), onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return AddRecordPage(trade: trades[index]);
        })
      );
    });
  }

  Future<Null> _onRefresh() async {
    var trades = await TradeService.instance.queryAllTrades(event: widget.event);
    setState(() {
      this.trades = trades;
    });
  }
}