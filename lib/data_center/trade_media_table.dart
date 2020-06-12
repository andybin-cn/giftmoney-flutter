import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/model/sql_trade_media.dart';
import 'package:sqflite/sqflite.dart';

class TradeMediaTable extends SQLTable {
  Database database;
  
  TradeMediaTable({this.database});

  @override
  Future onCreate(Database db, int version) async {
    return await db.execute("""CREATE TABLE SQLTradeMedia (
          uuid TEXT PRIMARY KEY,
          tradeID TEXT,
          type TEXT,
          path TEXT
        )""");
  }

  @override
  Future onUpgrade(Database db, int oldVersion, int newVersion) {
    return null;
  }


  Future<SQLTradeMedia> inserTradeMedia(SQLTradeMedia media) async {
    await database.insert("SQLTradeMedia", media.toJSON());
    return media;
  }
  Future<int> deleteTradeMedia(SQLTradeMedia media) async {
    return await database.delete("SQLTradeMedia", where: "uuid = ?", whereArgs: [media.uuid]);
  }
  Future<SQLTradeMedia> updateTradeMedia(SQLTradeMedia media) async {
    await database.update("SQLTradeMedia", media.toJSON(), where: "uuid = ?", whereArgs: [media.uuid]);
    return media;
  }
  Future<List<SQLTrade>> queryTradeMedia({bool distinct = false }) async {
    var tradeRows = await database.query("SQLTradeMedia",distinct: distinct, columns: columns, where: where, whereArgs: whereArgs, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);
    return tradeRows.map((row) {
      return SQLTrade.fromJSON(row);
    }).toList();
  }

  Future<List<SQLTradeMedia>> queryTradeByUUID({tradeID: String}) async {
    var mediaRows = await database.query("SQLTradeMedia", where: "tradeID = ?", whereArgs: [tradeID]);
    return mediaRows.map((row) {
      return SQLTradeMedia.fromJSON(row);
    }).toList();
  }
}