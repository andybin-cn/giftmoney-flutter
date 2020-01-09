

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/closable_left_scroll.dart';
import 'package:giftmoney/components/cells/trade_cell.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/trade_service.dart';

import 'add_record_page.dart';

class ContactRecordPage extends BaseStatefulPage {
  final SQLContact contact;
  ContactRecordPage({Key key, @required this.contact}) : super(key: key);

  _ContactRecordPageState createState() => _ContactRecordPageState();
}

class _ContactRecordPageState extends BasePageState<ContactRecordPage> {
  List<SQLTrade> trades = List<SQLTrade>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    title = widget.contact.contactName;
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
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0.5),
        itemBuilder: _renderRow,
        itemCount: trades.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ClosableLeftScroll(child: TradeCell(trade: trades[index]), onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return AddRecordPage(trade: trades[index]);
        })
      );
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
    var trades = await TradeService.instance.queryAllTrades(contact: widget.contact);
    setState(() {
      this.trades = trades;
    });
  }
}