import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/relation_cell.dart';
import 'package:giftmoney/model/sql_relation.dart';
import 'package:giftmoney/pages/relation_record_page.dart';
import 'package:giftmoney/service/trade_service.dart';

class RelationsStatisticsPage extends BaseStatefulPage {
  RelationsStatisticsPage({Key key}) : super(key: key);

  @override
  _RelationsStatisticsPageState createState() => _RelationsStatisticsPageState();
}

class _RelationsStatisticsPageState extends BasePageState<RelationsStatisticsPage> with AutomaticKeepAliveClientMixin {
  List<SQLRelation> relations = List<SQLRelation>();
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
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: _renderRow,
        itemCount: relations.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(title: RelationCell(relation: relations[index]), onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return RelationRecordPage(relation: relations[index]);
        })
      );
    });
  }

  Future<Null> _onRefresh() async {
    var relations = await TradeService.instance.queryTradeGroupByRelation();
    setState(() {
      this.relations = relations;
    });
  }

  @override
  bool get wantKeepAlive => true;
}