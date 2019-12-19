

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/trade_cell.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/trade_service.dart';

class HomeRecordPage extends BaseStatefulPage {
  HomeRecordPage({Key key}) : super(key: key);

  _HomeRecordPageState createState() => _HomeRecordPageState();
}

class _HomeRecordPageState extends BasePageState<HomeRecordPage> {
  List<SQLTrade> trades = List<SQLTrade>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _onRefresh();
    TradeService.instance.tradeStream.stream.listen((event) {
      _refreshKey.currentState.show();
    });
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
    return ListTile(title: TradeCell(trade: trades[index]));
  }

  Future<Null> _onRefresh() async {
    var trades = await TradeService.instance.queryAllTrades();
    setState(() {
      this.trades = trades;
    });
  }
}