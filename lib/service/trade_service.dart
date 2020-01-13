
import 'dart:async';
import 'dart:io';

import 'package:giftmoney/data_center/db_manager.dart';
import 'package:giftmoney/json_mapper/mappable.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/model/sql_relation.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/service/xls_parse_service.dart';
import 'package:giftmoney/utils/format_helper.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/utils/native_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

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
    if(trade.uuid != null && trade.uuid.trim().length > 0) {
      trade.updateAt = DateTime.now();
      var result = await DBManager.instance.tradeTable.updateTrade(trade);
      tradeStream.add(ObjectEvent<SQLTrade>(object: result, event: ObjectEventType.modify));
      return result;
    } else {
      trade.uuid = Uuid().v4();
      trade.createAt = DateTime.now();
      trade.updateAt = DateTime.now();
      var result = await DBManager.instance.tradeTable.inserTrade(trade);
      tradeStream.add(ObjectEvent<SQLTrade>(object: result, event: ObjectEventType.add));
      AccountService.instance.consumeGold(AccountService.instance.amountFor(ChargeItem.insertTrade));
      return result;
    }
  }

  Future<int> deleteTrade(SQLTrade trade) async {
    var result = await DBManager.instance.tradeTable.deleteTrade(trade);
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
    return DBManager.instance.tradeTable.queryTrade(where: where, whereArgs: whereArgs, orderBy: "createAt desc");
  }

  Future<List<SQLEvent>> queryTradeGroupByEvent() {
    return DBManager.instance.tradeTable.queryTradeGroupByEvent();
  }

  Future<List<SQLRelation>> queryTradeGroupByRelation() async {
    Map<String, SQLRelation> relationMap = Map<String, SQLRelation>();
    var trades = await DBManager.instance.tradeTable.queryTrade(limit: 1000000);
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
    return DBManager.instance.tradeTable.queryTradeGroupByContact();
  }

  Future<String> exportTradesToExcel() async {
    var trades = await queryAllTrades();
    var i18n = I18nUtil.shared;
    var headers = [
      i18n.excelHeaderId,
      i18n.excelHeaderPersonName,
      i18n.excelHeaderRelationName,
      i18n.excelHeaderEventName,
      i18n.excelHeaderEventTime,
      i18n.excelHeaderType,
      i18n.excelHeaderValue,
      i18n.excelHeaderRemark,
      i18n.excelHeaderCreateAt,
      i18n.excelHeaderUpdateAt,
    ];
    var excelBody = trades.map((trade) {
      return [
        trade.uuid.toString(),
        trade.personName,
        trade.relationName,
        trade.eventName,
        FormatHelper.dateToString(trade.eventTime),
        EnumMappableUtil.serializeEnum(trade.type, SQLTradeTypeMap),
        trade.value.toString(),
        trade.remark,
        FormatHelper.dateToString(trade.createAt),
        FormatHelper.dateToString(trade.updateAt),
      ];
    }).toList();
    var excelData = [headers] + excelBody;
    var tempPath =  await getRecodsPath();
    var destinationPath = tempPath + "${DateTime.now().toIso8601String()}.xlsx";
    print("exportTradesToExcel destinationPath:${destinationPath}");
    await NativeUtils.exportToExcel(destinationPath, excelData);
    AccountService.instance.consumeGold(AccountService.instance.amountFor(ChargeItem.exportToExcel));
    return destinationPath;
  }

  Future<String> getRecodsPath() async {
    Directory tempDir;
    if(Platform.isAndroid) {
      tempDir =  await getExternalStorageDirectory();
    } else {
      tempDir =  await getApplicationDocumentsDirectory();
    }
    // var tempDir =  await getApplicationSupportDirectory();
    var path = tempDir.path + "/records/";
    var dir = Directory(path);
    if(!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return path;
  }

  Future<ImportTradeResult> importTrades(List<List<String>> sheet) async {
    var trades = XLSParseService.instance.parseXLSData(sheet);
    var result = ImportTradeResult();
    for (var trade in trades) {
      try {
        if(trade.uuid != null && trade.uuid.trim().length > 0) {
          var oldTrade = await DBManager.instance.tradeTable.queryTradeByUUID(uuid: trade.uuid);
          if(oldTrade != null) {
            result.skipCount++;
            continue;
          }
        }
        await DBManager.instance.tradeTable.inserTrade(trade);
        tradeStream.add(ObjectEvent<SQLTrade>(object: trade, event: ObjectEventType.add));
        result.successCount++;
      } catch (e) {
        result.errorCount++;
        print("importTrades saveTrade error:${e}");
      }
    }
    AccountService.instance.consumeGold(AccountService.instance.amountFor(ChargeItem.importFromExcel));
    return result;
  }
}

class ImportTradeResult {
  var successCount = 0;
  var errorCount = 0;
  var skipCount = 0;
}