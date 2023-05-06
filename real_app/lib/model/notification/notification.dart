
import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable()
class NotificationObj{
  String groupName;
  String type;
  String message;

  NotificationObj(this.groupName, this.type, this.message);

  factory NotificationObj.fromJson(Map<String,dynamic> json) => _$NotificationFromJson(json);
  Map<String,dynamic> toJson() => _$NotificationToJson(this);
}