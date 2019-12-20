import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/contact_cell.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/service/trade_service.dart';

import 'contact_record_page.dart';

class ContactsStatisticsPage extends BaseStatefulPage {
  ContactsStatisticsPage({Key key}) : super(key: key);

  @override
  _ContactsStatisticsPageState createState() => _ContactsStatisticsPageState();
}

class _ContactsStatisticsPageState extends BasePageState<ContactsStatisticsPage> with AutomaticKeepAliveClientMixin {
  List<SQLContact> contacts = List<SQLContact>();
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
        itemCount: contacts.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(title: ContactCell(contact: contacts[index]), onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return ContactRecordPage(contact: contacts[index]);
        })
      );
    });
  }

  Future<Null> _onRefresh() async {
    var contacts = await TradeService.instance.queryTradeGroupByContact();
    setState(() {
      this.contacts = contacts;
    });
  }

  @override
  bool get wantKeepAlive => true;
}