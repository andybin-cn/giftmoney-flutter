import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'sql_trade.g.dart';

enum SQLTradeType {
  inAccount,
  outAccount
}

enum SQLTradeValueType {
  money,
  gift,
  other
}

enum TradeUploadState {
  notUpload,
  uploading,
  success,
  warning
}

@JsonSerializable()
class SQLTrade {
  int id;
  int eventID;
  int relationID;
  int personID;
  DateTime createAt;
  DateTime updateAt;

  String eventName;
  DateTime eventTime;
  String relationName;
  String personName;

  SQLTradeType type;
  SQLTradeValueType valueType;
  String value;
  String giftName;
  String unit;
  String remark;

  SQLTrade(this.id, this.eventID, this.relationID, this.personID, this.createAt, this.updateAt, this.eventName, this.eventTime, this.relationName, this.personName, this.type, this.valueType, this.value, this.unit, this.remark, this.giftName);

  //不同的类使用不同的mixin即可
  factory SQLTrade.fromJson(Map<String, dynamic> json) => _$SQLTradeFromJson(json);
  Map<String, dynamic> toJson() => _$SQLTradeToJson(this);

  String get formatValue {
    String flag = type == SQLTradeType.inAccount ? "+" : "-";
    switch (valueType) {
      case SQLTradeValueType.money:
        return "$flag $value 元";
        break;
      case SQLTradeValueType.gift:
        return "$giftName $flag $value $unit";
        break;
      default:
        return "$flag $value 元";
    }
  }
}