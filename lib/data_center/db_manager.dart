
import 'package:giftmoney/data_center/key_value_table.dart';
import 'package:giftmoney/data_center/trade_media_table.dart';
import 'package:giftmoney/data_center/trade_table.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

enum ObjectEventType { add, modify, delete }
class ObjectEvent<T> {
  T object;
  ObjectEventType event;
  ObjectEvent({this.object, this.event}) {

  }
}

abstract class SQLTable {
  Future onCreate (Database db, int version);
  Future onUpgrade (Database db, int oldVersion, int newVersion);
}

class DBManager {
  // 工厂模式
  factory DBManager() =>_getInstance();
  static DBManager get instance => _getInstance();
  static DBManager _instance;
  DBManager._internal() {

  }

  static DBManager _getInstance() {
    if (_instance == null) {
      _instance = new DBManager._internal();
    }
    return _instance;
  }

  Database database;
  TradeTable tradeTable;
  TradeMediaTable tradeMediaTable;
  KeyValueTable keyValue;
  Future<Null> initDB() async {
    var databasesPath = await getDatabasesPath();
    if(!databasesPath.endsWith('/')) {
      databasesPath += '/';
    }
    String path = databasesPath + 'shared.sqlite';
    print('databasesPath:'+path);
    database = await openDatabase(path, 
      version: 1,
      onCreate: (Database db, int version) async {
        await TradeTable(database: db).onCreate(db, version);
        await TradeMediaTable(database: db).onCreate(db, version);
        await KeyValueTable(database: db).onCreate(db, version);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        await TradeTable(database: db).onUpgrade(db, oldVersion, newVersion);
        await TradeMediaTable(database: db).onUpgrade(db, oldVersion, newVersion);
        await KeyValueTable(database: db).onUpgrade(db, oldVersion, newVersion);
      }
    );
    tradeTable = TradeTable(database: database);
    tradeMediaTable = TradeMediaTable(database: database);
    keyValue = KeyValueTable(database: database);
  }
}