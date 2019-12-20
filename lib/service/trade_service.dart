
import 'dart:async';

import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_relation.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/utils/format_helper.dart';

class TradeService {
  // 工厂模式
  factory TradeService() =>_getInstance();
  static TradeService get instance => _getInstance();
  static TradeService _instance;
  TradeService._internal() {
    // 初始化
    tradeStream = StreamController<ObjectEvent<SQLTrade>>.broadcast();
  }
  static TradeService _getInstance() {
    if (_instance == null) {
      _instance = new TradeService._internal();
    }
    return _instance;
  }

  StreamController<ObjectEvent<SQLTrade>> tradeStream;

  Future<SQLTrade> saveTrade(SQLTrade trade) async {
    if(trade.id != null && trade.id > 0) {
      trade.updateAt = DateTime.now();
      var result = await DBManager.instance.updateTrade(trade);
      tradeStream.add(ObjectEvent<SQLTrade>(object: result, event: ObjectEventType.modify));
      return result;
    } else {
      trade.createAt = DateTime.now();
      trade.updateAt = DateTime.now();
      var result = await DBManager.instance.inserTrade(trade);
      tradeStream.add(ObjectEvent<SQLTrade>(object: result, event: ObjectEventType.add));
      return result;
    }
  }

  Future<int> deleteTrade(SQLTrade trade) async {
    var result = await DBManager.instance.deleteTrade(trade);
    if(result > 0) {
      tradeStream.add(ObjectEvent<SQLTrade>(object: trade, event: ObjectEventType.delete));
    }
    return result;
  }

  Future<List<SQLTrade>> queryAllTrades({SQLEvent event, SQLRelation relation, SQLContact contact}) {
    var where = "";
    var whereArgs = [];
    if (relation != null) {
      where += "relationName = ?";
      whereArgs.addAll([relation.relationName]);
    }
    if (contact != null) {
      if (where.length > 0) {
        where += " AND ";
      }
      where += "personName = ?";
      whereArgs.addAll([contact.contactName]);
    }
    if (event != null) {
      if (where.length > 0) {
        where += " AND ";
      }
      where != "eventName = ? AND date(eventTime) = ?";
      whereArgs.addAll([event.eventName, FormatHelper.dateToString(event.eventTime)]);
    }
    if(where.length == 0) {
      where = null;
      whereArgs = null;
    }
    return DBManager.instance.queryTrade(where: where, whereArgs: whereArgs, orderBy: "updateAt desc");
  }

  Future<List<SQLEvent>> queryTradeGroupByEvent() {
    return DBManager.instance.queryTradeGroupByEvent();
  }

  Future<List<SQLRelation>> queryTradeGroupByRelation() async {
    Map<String, SQLRelation> relationMap = Map<String, SQLRelation>();
    var trades = await DBManager.instance.queryTrade(limit: 1000000);
    trades.forEach((trade) {
      var relation = relationMap[trade.relationName];
      if(relation == null) {
        relation = SQLRelation(trade.relationName);
        relationMap[trade.relationName] = relation;
      }
      if(trade.type == SQLTradeType.inAccount) {
        relation.incomeAmount += trade.value;
      } else {
        relation.expendAmount += trade.value;
      }
      relation.recordsCount += 1;
      relation.contacts.add(trade.personName);
    });
    var result = relationMap.values.toList();
    result.sort((a, b) => b.expendAmount + b.incomeAmount - a.expendAmount - a.incomeAmount );
    return result;
  }

  Future<List<SQLContact>> queryTradeGroupByContact() {
    return DBManager.instance.queryTradeGroupByContact();
  }
  

}