
import 'package:giftmoney/model/sql_trade.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

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
          eventTime DateTime,
          relationName TEXT,
          personName TEXT,
          type INTEGER,
          valueType INTEGER,
          value TEXT,
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
    int id = await database.insert("SQLTrade", trade.toJson());
    trade.id = id;
    return trade;
  }
  Future<SQLTrade> updateTrade(SQLTrade trade) async {
    await database.update("SQLTrade", trade.toJson());
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
      var tradeRows = await database.query("SQLTrade",distinct: distinct, columns: columns, where: where, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);    return tradeRows.map((row) {
      return SQLTrade.fromJson(row);
    }).toList();
  }
}