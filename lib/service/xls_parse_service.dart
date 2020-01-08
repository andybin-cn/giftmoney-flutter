import 'dart:collection';

import 'package:giftmoney/json_mapper/mappable.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/utils/format_helper.dart';

class XLSHeader {
  var uuid = -1;
  var name = -1;
  var relation = -1;
  var type = -1;
  var eventName = -1;
  var eventTime = -1;
  var totoalMoney = -1;
  var remark = -1;
  var createTime = -1;
  var updateTime = -1;
  var tradeItems = -1;
  var tradeMedias = -1;

  var idCloums = HashSet<String>.from(["ID", "UUID", "Id", "uuid", "id"]);
  var nameCloums =
      HashSet<String>.from(["姓名", "名字", "name", "Name", "NAME", "personName"]);
  var relationCloums = HashSet.from([
    "关系",
    "關係",
    "relation",
    "Relation",
    "RelationShip",
    "relationship",
    "Relationship"
  ]);
  var typeCloums = HashSet.from(["类型", "类别", "收支", "類型", "類別", "type"]);
  var eventNameCloums = HashSet.from(["事件", "事件名称", "事件名稱", "eventName"]);
  var eventTimeCloums = HashSet.from(["事件时间", "eventTime"]);
  var totoalMoneyCloums = HashSet.from([
    "金额",
    "红包",
    "总金额(元)",
    "总金额",
    "数量",
    "金額",
    "紅包",
    "總金額(元)",
    "總金額",
    "數量",
    "value",
    "amount"
  ]);
  var remarkCloums = HashSet.from(["备注", "備註", "remark"]);
  var createTimeCloums = HashSet.from(["创建时间", "創建時間", "createAt"]);
  var updateTimeCloums = HashSet.from(["最近修改时间", "修改时间", "修改時間", "updateAt"]);

  XLSHeader(List<String> header) {
    for (var index = 0; index < header.length; index++) {
      var value = header[index];
      if (value == null || value.trim() == "") {
        continue;
      }
      if (this.uuid < 0 && idCloums.contains(value)) {
        this.uuid = index;
        continue;
      }
      if (this.name < 0 && nameCloums.contains(value)) {
        this.name = index;
        continue;
      }
      if (this.relation < 0 && relationCloums.contains(value)) {
        this.relation = index;
        continue;
      }
      if (this.type < 0 && typeCloums.contains(value)) {
        this.type = index;
        continue;
      }
      if (this.eventName < 0 && eventNameCloums.contains(value)) {
        this.eventName = index;
        continue;
      }
      if (this.eventTime < 0 && eventTimeCloums.contains(value)) {
        this.eventTime = index;
        continue;
      }
      if (this.totoalMoney < 0 && totoalMoneyCloums.contains(value)) {
        this.totoalMoney = index;
        continue;
      }
      if (this.remark < 0 && remarkCloums.contains(value)) {
        this.remark = index;
        continue;
      }
      if (this.createTime < 0 && createTimeCloums.contains(value)) {
        this.createTime = index;
        continue;
      }
      if (this.updateTime < 0 && updateTimeCloums.contains(value)) {
        this.updateTime = index;
        continue;
      }
    }
  }
}

class XLSParseService {
  // 工厂模式
  factory XLSParseService() => _getInstance();
  static XLSParseService get instance => _getInstance();
  static XLSParseService _instance;
  XLSParseService._internal() {
    // 初始化
  }
  static XLSParseService _getInstance() {
    if (_instance == null) {
      _instance = new XLSParseService._internal();
    }
    return _instance;
  }

  String value(List<String> row, int index) {
    if(index >= 0 && index < row.length) {
      return row[index];
    } else {
      return "";
    }
  }

  int intValue(List<String> row, int index) {
    return int.parse(value(row, index));
  }

  DateTime datetimeValue(List<String> row, int index) {
    return FormatHelper.dateFromString(value(row, index));
  }

  List<SQLTrade> parseXLSData(List<List<String>> sheet) {
    List<SQLTrade> result = List<SQLTrade>();
    if(sheet.length < 2) {
      return result;
    }
    var header = XLSHeader(sheet[0]);
    for(var rowIndex = 1; rowIndex < sheet.length; rowIndex++) {
      try {
        var row = sheet[rowIndex];
        var trade = SQLTrade();
        trade.uuid = value(row, header.uuid);
        trade.personName = value(row, header.name);
        trade.relationName = value(row, header.relation);
        trade.type = EnumMappableUtil.transformEnum(value(row, header.type), SQLTradeTypeMap);
        trade.eventName = value(row, header.eventName);
        trade.eventTime = datetimeValue(row, header.eventTime);
        trade.value = intValue(row, header.totoalMoney);
        trade.remark = value(row, header.remark);
        trade.createAt = datetimeValue(row, header.createTime);
        trade.updateAt = datetimeValue(row, header.updateTime);
        result.add(trade);
      } catch(e) {
        print("parseXLSData error index:${rowIndex} data:${sheet[rowIndex]}");
      }
    }
    return result;
  }
}
