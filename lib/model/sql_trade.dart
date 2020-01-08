import 'package:giftmoney/json_mapper/mappable.dart';
import 'package:giftmoney/utils/format_helper.dart';

enum SQLTradeType {
  inAccount,
  outAccount
}
enum SQLTradeValueType {
  money,
  gift,
  other
}

const Map<String, SQLTradeType> SQLTradeTypeMap = {
  'inAccount': SQLTradeType.inAccount,
  'outAccount': SQLTradeType.outAccount,
};

const Map<String, SQLTradeValueType> SQLTradeValueTypeMap = {
  'gift': SQLTradeValueType.gift,
  'money': SQLTradeValueType.money,
  'other': SQLTradeValueType.other,
};

enum TradeUploadState {
  notUpload,
  uploading,
  success,
  warning
}

class SQLTrade extends Mappable {
  String uuid;
  int eventID;
  int relationID;
  int personID;
  DateTime createAt;
  DateTime updateAt;
  String eventName;
  DateTime eventTime;
  String relationName;
  String personName;
  num value;
  String giftName;
  String unit;
  String remark;

  SQLTradeType type;
  SQLTradeValueType valueType;

  SQLTrade() : super.fromJSON(null);

  SQLTrade.fromJSON(Map<String, dynamic> map) : super.fromJSON(null) {
    uuid = transformBasic(map["uuid"]);
    eventID = transformBasic(map["eventID"]);
    relationID = transformBasic(map["relationID"]);
    personID = transformBasic(map["personID"]);
    createAt = transformBasic(map["createAt"]);
    updateAt = transformBasic(map["updateAt"]);
    eventName = transformBasic(map["eventName"]);
    eventTime = transformBasic(map["eventTime"]);
    relationName = transformBasic(map["relationName"]);
    personName = transformBasic(map["personName"]);
    value = transformBasic(map["value"]);
    giftName = transformBasic(map["giftName"]);
    unit = transformBasic(map["unit"]);
    remark = transformBasic(map["remark"]);

    type = transformEnum(map["type"], SQLTradeTypeMap);
    valueType = transformEnum(map["valueType"], SQLTradeValueTypeMap);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'uuid': uuid,
      'eventID': eventID,
      'relationID': relationID,
      'personID': personID,
      'createAt': createAt?.toIso8601String(),
      'updateAt': updateAt?.toIso8601String(),
      'eventName': eventName,
      'eventTime': eventTime?.toIso8601String(),
      'relationName': relationName,
      'personName': personName,
      'type': serializeEnum(type, SQLTradeTypeMap),
      'valueType': serializeEnum(valueType, SQLTradeValueTypeMap),
      'value': value,
      'giftName': giftName,
      'unit': unit,
      'remark': remark
    };
  }

  String get formatValue {
    String flag = type == SQLTradeType.inAccount ? "+" : "-";
    
    switch (valueType) {
      case SQLTradeValueType.money:
        return "$flag ${FormatHelper.formatCurrency(value)}";
        break;
      case SQLTradeValueType.gift:
        return "$giftName $flag $value $unit";
        break;
      default:
        return "$flag ${FormatHelper.formatCurrency(value)}";
    }
  }
}