// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SQLTrade _$SQLTradeFromJson(Map<String, dynamic> json) {
  return SQLTrade(
      json['id'] as int,
      json['eventID'] as int,
      json['relationID'] as int,
      json['personID'] as int,
      json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      json['eventName'] as String,
      json['eventTime'] == null
          ? null
          : DateTime.parse(json['eventTime'] as String),
      json['relationName'] as String,
      json['personName'] as String,
      _$enumDecodeNullable(_$SQLTradeTypeEnumMap, json['type']),
      _$enumDecodeNullable(_$SQLTradeValueTypeEnumMap, json['valueType']),
      json['value'] as num,
      json['unit'] as String,
      json['remark'] as String,
      json['giftName'] as String);
}

Map<String, dynamic> _$SQLTradeToJson(SQLTrade instance) => <String, dynamic>{
      'id': instance.id,
      'eventID': instance.eventID,
      'relationID': instance.relationID,
      'personID': instance.personID,
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'eventName': instance.eventName,
      'eventTime': instance.eventTime?.toIso8601String(),
      'relationName': instance.relationName,
      'personName': instance.personName,
      'type': _$SQLTradeTypeEnumMap[instance.type],
      'valueType': _$SQLTradeValueTypeEnumMap[instance.valueType],
      'value': instance.value,
      'giftName': instance.giftName,
      'unit': instance.unit,
      'remark': instance.remark
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$SQLTradeTypeEnumMap = <SQLTradeType, dynamic>{
  SQLTradeType.inAccount: 'inAccount',
  SQLTradeType.outAccount: 'outAccount'
};

const _$SQLTradeValueTypeEnumMap = <SQLTradeValueType, dynamic>{
  SQLTradeValueType.money: 'money',
  SQLTradeValueType.gift: 'gift',
  SQLTradeValueType.other: 'other'
};
