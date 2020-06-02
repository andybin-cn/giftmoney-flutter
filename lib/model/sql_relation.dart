
import 'package:giftmoney/json_mapper/mappable.dart';

class SQLRelation extends Mappable {
  String relationName = '';
  int get contactsCount {
    return contacts.length;
  }
  int recordsCount = 0;
  num incomeAmount = 0;
  num expendAmount = 0;
  Set<String> contacts = Set<String>();
  
  SQLRelation(this.relationName) : super.fromJSON(null);

  SQLRelation.fromJSON(Map<String, dynamic> map) : super.fromJSON(map) {
    relationName = transformBasic(map['relationName']);
    recordsCount = transformBasic(map['recordsCount']);
    incomeAmount = transformBasic(map['incomeAmount']);
    expendAmount = transformBasic(map['expendAmount']);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic> {
      'relationName': relationName,
      'contactsCount': contactsCount,
      'recordsCount': recordsCount,
      'incomeAmount': incomeAmount,
      'expendAmount': expendAmount,
    };
  }
}