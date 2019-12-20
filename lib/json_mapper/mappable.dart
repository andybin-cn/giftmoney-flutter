

abstract class Mappable {
  Mappable.fromJSON(Map<String, dynamic> map);
  Map<String, dynamic> toJSON();

  T transformBasic<T>(dynamic jsonValue) {
    if(jsonValue == null) {
      return null;
    }
    if(jsonValue is T) {
      return jsonValue;
    } else if(T == String) {
      return jsonValue.toString() as T;
    } else if(T == DateTime) {
      return DateTime.parse(jsonValue.toString()) as T;
    } else if(jsonValue is String) {
      switch (T) {
        case int:
          return int.parse(jsonValue) as T;
        case double:
          return double.parse(jsonValue) as T;
        case num:
          return num.parse(jsonValue) as T;
        case num:
          return num.parse(jsonValue) as T;
        default:
      }
    }
    return null;
  }

  T transformEnum<T>(dynamic jsonValue, Map<String, T> maps) {
    return maps[jsonValue.toString()];
  }

  String serializeEnum<T>(dynamic jsonValue, Map<String, T> maps) {
    return maps.entries.singleWhere((e) => e.value == jsonValue).key;
  }
}