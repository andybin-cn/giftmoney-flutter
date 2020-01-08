
import 'package:giftmoney/json_mapper/mappable.dart';

class SQLContact extends Mappable {
  String contactName = "";
  int recordsCount = 0;
  num incomeAmount = 0;
  num expendAmount = 0;
  
  SQLContact(this.contactName) : super.fromJSON(null);

  SQLContact.fromJSON(Map<String, dynamic> map) : super.fromJSON(map) {
    contactName = transformBasic(map["contactName"]);
    recordsCount = transformBasic(map["recordsCount"]);
    incomeAmount = transformBasic(map["incomeAmount"]);
    expendAmount = transformBasic(map["expendAmount"]);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic> {
      "contactName": contactName,
      "recordsCount": recordsCount,
      "incomeAmount": incomeAmount,
      "expendAmount": expendAmount,
    };
  }
}