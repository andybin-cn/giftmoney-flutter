
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/sql_trade.dart';

class TradeService {
  // 工厂模式
  factory TradeService() =>_getInstance();
  static TradeService get instance => _getInstance();
  static TradeService _instance;
  TradeService._internal() {
    // 初始化
  }
  static TradeService _getInstance() {
    if (_instance == null) {
      _instance = new TradeService._internal();
    }
    return _instance;
  }


  Future<SQLTrade> saveTrade(SQLTrade trade) async {
    if(trade.id != null && trade.id > 0) {
      trade.updateAt = DateTime.now();
      return await DBManager.instance.updateTrade(trade);
    } else {
      trade.createAt = DateTime.now();
      trade.updateAt = DateTime.now();
      return await DBManager.instance.inserTrade(trade);
    }
  }

  Future<List<SQLTrade>> queryAllTrades() {
    return DBManager.instance.queryTrade(orderBy: "updateAt desc");
  }
  

}