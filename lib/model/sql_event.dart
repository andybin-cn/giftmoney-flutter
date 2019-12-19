
import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'sql_event.g.dart';

@JsonSerializable()
class SQLEvent {
  String eventName;
  DateTime eventTime;
  int count;
  String incomeAmount;
  String expendAmount;
  DateTime updateAt;

  SQLEvent(this.eventName, this.eventTime, this.count, this.expendAmount, this.incomeAmount, this.updateAt);
  //不同的类使用不同的mixin即可
  factory SQLEvent.fromJson(Map<String, dynamic> json) => _$SQLEventFromJson(json);
  Map<String, dynamic> toJson() => _$SQLEventToJson(this);
}