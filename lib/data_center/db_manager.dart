
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

enum ObjectEventType { add, modify, delete }
class ObjectEvent<T> {
  T object;
  ObjectEventType event;
  ObjectEvent({this.object, this.event}) {

  }
}

class DBManager {
  // 工厂模式
  factory DBManager() =>_getInstance();
  static DBManager get instance => _getInstance();
  static DBManager _instance;
  DBManager._internal() {
    // 初始化
  }
  static DBManager _getInstance() {
    if (_instance == null) {
      _instance = new DBManager._internal();
    }
    return _instance;
  }

  Database database;
  Future<Null> initDB() async {
    var databasesPath = await getDatabasesPath();
    if(!databasesPath.endsWith("/")) {
      databasesPath += "/";
    }
    String path = databasesPath + "shared.sqlite";
    print("databasesPath:"+path);
    database = await openDatabase(path, 
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""CREATE TABLE SQLTrade (
          id INTEGER PRIMARY KEY,
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
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        //todo: 数据库升级
      }
    );
  }

  Future<SQLTrade> inserTrade(SQLTrade trade) async {
    int id = await database.insert("SQLTrade", trade.toJSON());
    trade.id = id;
    return trade;
  }
  Future<int> deleteTrade(SQLTrade trade) async {
    return await database.delete("SQLTrade", where: "id = ?", whereArgs: [trade.id]);
  }
  Future<SQLTrade> updateTrade(SQLTrade trade) async {
    await database.update("SQLTrade", trade.toJSON(), where: "id = ?", whereArgs: [trade.id]);
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
}