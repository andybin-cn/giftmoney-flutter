

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/closable_left_scroll.dart';
import 'package:giftmoney/components/cells/trade_cell.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/pages/add_record_page.dart';
import 'package:giftmoney/pages/webview_test_page.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/utils/native_utils.dart';

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
      child: ListView.separated(
        // physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0.5,),
        itemBuilder: _renderRow,
        itemCount: trades.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    // LeftScrollListItem
    return ClosableLeftScroll(child: TradeCell(trade: trades[index]), onTap: () async {
      dynamic result = await NativeUtils.startWebView(url: 'https://darling-secret.herokuapp.com/share/app');
      print("startWebView result: ${result}");
      // Navigator.push(context,
      //   MaterialPageRoute(builder: (context) {
      //     return WebViewTestPage();
      //       // return AddRecordPage(trade: trades[index]);
      //   })
      // );
    }, buttons: <Widget>[
        LeftScrollItem(
          text: i18n.bt_delete,
          color: Colors.red,
          onTap: () async {
            ClosableLeftScrollState.closeAll();
            this.showLoading();
            await TradeService.instance.deleteTrade(trades[index]);
            trades.removeAt(index);
            this.hideLoading();
            this.setState(() {});
          },
        ),
    ]);
  }

  Future<Null> _onRefresh() async {
    var trades = await TradeService.instance.queryAllTrades();
    setState(() {
      this.trades = trades;
    });
  }
}