import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:sqflite/sqflite.dart';

class TradeTable extends SQLTable {
  Database database;
  
  TradeTable({this.database});

  @override
  Future onCreate(Database db, int version) async {
    return await db.execute("""CREATE TABLE SQLTrade (
          uuid TEXT PRIMARY KEY,
          eventID INTEGER,
          relationID INTEGER,
          personID INTEGER,
          createAt DateTime,
          updateAt DateTime,
          eventName TEXT,
          eventTime Date,
          relationName TEXT,
          personName TEXT,
          type TEXT,
          valueType INTEGER,
          value NUMBER,
          giftName TEXT,
          unit TEXT,
          remark TEXT
        )""");
  }

  @override
  Future onUpgrade(Database db, int oldVersion, int newVersion) {
    return null;
  }


  Future<SQLTrade> inserTrade(SQLTrade trade) async {
    await database.insert("SQLTrade", trade.toJSON());
    return trade;
  }
  Future<int> deleteTrade(SQLTrade trade) async {
    return await database.delete("SQLTrade", where: "uuid = ?", whereArgs: [trade.uuid]);
  }
  Future<SQLTrade> updateTrade(SQLTrade trade) async {
    await database.update("SQLTrade", trade.toJSON(), where: "uuid = ?", whereArgs: [trade.uuid]);
    return trade;
  }
  Future<List<SQLTrade>> queryTrade({bool distinct = false,
      List<String> columns,
      String where,
      List<dynamic> whereArgs,
      String groupBy,
      String having,
      String orderBy,
      int limit = 100,
      int offset = 0}) async {
    var tradeRows = await database.query("SQLTrade",distinct: distinct, columns: columns, where: where, whereArgs: whereArgs, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);
    return tradeRows.map((row) {
      return SQLTrade.fromJSON(row);
    }).toList();
  }

  Future<SQLTrade> queryTradeByUUID({uuid: String}) async {
    var tradeRows = await database.query("SQLTrade", where: "uuid = ?", whereArgs: [uuid]);
    if(tradeRows.length > 0) {
      return SQLTrade.fromJSON(tradeRows.first);
    } else {
      return null;
    }
  }

  Future<List<SQLEvent>> queryTradeGroupByEvent({bool distinct = false,
      List<String> columns,
      String where,
      List<dynamic> whereArgs,
      String groupBy,
      String having,
      String orderBy,
      int limit = 100,
      int offset = 0}) async {
    var rows = await database.query("SQLTrade",
      distinct: distinct,
      columns: ["eventName", "eventTime","date(eventTime) as eventDate", "count(eventName) as 'count'", "sum(value * (10 - LENGTH(type))) incomeAmount", "sum(value * (LENGTH(type) - 9)) expendAmount", "max(updateAt) updateAt"],
      where: where,
      whereArgs: whereArgs,
      groupBy: "eventName, eventDate", having: having, orderBy: orderBy, limit: limit, offset: offset);
    return rows.map((row) {
      return SQLEvent.fromJSON(row);
    }).toList();
  }

  Future<List<SQLContact>> queryTradeGroupByContact() async {
    var rows = await database.query("SQLTrade",
      columns: ["personName as contactName", "count(eventName) as 'recordsCount'", "sum(value * (10 - LENGTH(type))) incomeAmount", "sum(value * (LENGTH(type) - 9)) expendAmount"],
      groupBy: "personName", orderBy: "personName ASC");
    return rows.map((row) {
      return SQLContact.fromJSON(row);
    }).toList();
  }
}