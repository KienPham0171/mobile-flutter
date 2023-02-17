import 'package:json_annotation/json_annotation.dart';
part 'create_meal_request.g.dart';
@JsonSerializable()
class CreateMealRequest{
  String foodName;
  String billTotal;
  DateTime foodDate;
  int groupId;
  String userList;

  CreateMealRequest(this.foodName, this.billTotal, this.foodDate, this.groupId,
      this.userList);

  Map<String,dynamic> toJson() => _$CreateMealRequestToJson(this);
}