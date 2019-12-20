
import 'package:giftmoney/json_mapper/mappable.dart';

class SQLEvent extends Mappable {
  String eventName;
  DateTime eventTime;
  int count;
  num incomeAmount;
  num expendAmount;
  DateTime updateAt;

  SQLEvent.fromJSON(Map<String, dynamic> map) : super.fromJSON(map) {
    eventName = transformBasic(map["eventName"]);
    eventTime = transformBasic(map["eventTime"]);
    count = transformBasic(map["count"]);
    incomeAmount = transformBasic(map["incomeAmount"]);
    expendAmount = transformBasic(map["expendAmount"]);
    updateAt = transformBasic(map["updateAt"]);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic> {
      "eventName": eventName,
      "eventTime": eventTime?.toIso8601String(),
      "count": count,
      "incomeAmount": incomeAmount,
      "expendAmount": expendAmount,
      "updateAt": updateAt?.toIso8601String(),
    };
  }
}