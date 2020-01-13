

import 'package:flutter/cupertino.dart';
import 'package:giftmoney/data_center/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class KeyValueTable extends SQLTable {
  Database database;
  
  KeyValueTable({this.database});

  @override
  Future onCreate(Database db, int version) async {
    var result =  await db.execute("""CREATE TABLE SQLKeyValue (
          key TEXT PRIMARY KEY,
          value TEXT,
          createAt DateTime,
          updateAt DateTime
        )""");
    return result;
  }

  @override
  Future onUpgrade(Database db, int oldVersion, int newVersion) {
    return null;
  }

  Future<int> save({@required String key, @required String value}) async {
    try {
      return await database.insert("SQLKeyValue", {"key": key, "value": value});
    } catch(error) {
      return await database.update("SQLKeyValue", {"value": value}, where: "key = ?", whereArgs: [key]);
    }
  }
  Future<int> removeKey(String key) async {
    return await database.delete("SQLKeyValue", where: "key = ?", whereArgs: [key]);
  }
  Future<String> valueForKey(String key) async {
    var rows = await database.query("SQLKeyValue", where: "key = ?", whereArgs: [key]);
    if(rows.isNotEmpty) {
      return rows.first["value"];
    }
    return null;
  }

}