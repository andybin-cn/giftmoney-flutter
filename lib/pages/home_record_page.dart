

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/trade_cell.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/pages/add_record_page.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';
import 'package:left_scroll_actions/left_scroll_list.dart';

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
    title = I18nUtil.shared.tab_record_title;
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
      child: LeftScrollList.builder(
        // physics: const AlwaysScrollableScrollPhysics(),
        // separatorBuilder: (BuildContext context, int index) => Divider(),
        builder: _renderRow,
        count: trades.length,
      ),
    );
  }

  LeftScrollListItem _renderRow(BuildContext context, int index) {
    return LeftScrollListItem(
      key: index.toString(),
      child: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
            TradeCell(trade: trades[index]),
            Divider(height: 0.5, color: Colors.grey[300],)
          ],
        ),
      ),
      buttons: [
        LeftScrollItem(
          text: 'delete',
          color: Colors.red,
          onTap: () async {
            this.showLoading();
            await TradeService.instance.deleteTrade(trades[index]);
            trades.removeAt(index);
            this.hideLoading();
            this.setState(() {});
          },
        ),
      ],
      onTap: () {
        print('tap row');
        Navigator.push(context,
          MaterialPageRoute(builder: (context) {
              return AddRecordPage(trade: trades[index]);
          })
        );
      },
    );
  }

  Future<Null> _onRefresh() async {
    var trades = await TradeService.instance.queryAllTrades();
    setState(() {
      this.trades = trades;
    });
  }
}