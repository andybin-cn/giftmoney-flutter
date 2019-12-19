// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SQLEvent _$SQLEventFromJson(Map<String, dynamic> json) {
  return SQLEvent(
      json['eventName'] as String,
      json['eventTime'] == null
          ? null
          : DateTime.parse(json['eventTime'] as String),
      json['count'] as int,
      json['expendAmount'] as String,
      json['incomeAmount'] as String,
      json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String));
}

Map<String, dynamic> _$SQLEventToJson(SQLEvent instance) => <String, dynamic>{
      'eventName': instance.eventName,
      'eventTime': instance.eventTime?.toIso8601String(),
      'count': instance.count,
      'incomeAmount': instance.incomeAmount,
      'expendAmount': instance.expendAmount,
      'updateAt': instance.updateAt?.toIso8601String()
    };
