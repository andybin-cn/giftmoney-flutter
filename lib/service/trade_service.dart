
import 'dart:async';

import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/sql_event.dart';
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

  Future<List<SQLTrade>> queryAllTrades({SQLEvent event}) {
    if (event != null) {
      return DBManager.instance.queryTrade(where: "eventName = ? AND date(eventTime) = ?", whereArgs: [event.eventName, FormatHelper.dateToString(event.eventTime)], orderBy: "updateAt desc");
    }
    return DBManager.instance.queryTrade(orderBy: "updateAt desc");
  }

  Future<List<SQLEvent>> queryTradeGroupByEvent() {
    return DBManager.instance.queryTradeGroupByEvent();
  }
  

}