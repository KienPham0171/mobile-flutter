import 'package:json_annotation/json_annotation.dart';
part 'group.g.dart';

@JsonSerializable()
class Group{
  int id;
  String groupName;
  String groupDesc;

  @JsonKey(includeFromJson: false)
  bool isExpanded;

  Group(this.id, this.groupName, this.groupDesc,{this.isExpanded = false});


  @override
  String toString() {
    return 'Group{id: $id, groupName: $groupName, groupDesc: $groupDesc, isExpanded: $isExpanded}';
  }

  factory Group.fromJson(Map<String,dynamic> json) =>_$GroupFromJson(json);
  Map<String,dynamic> toJson() => _$GroupToJson(this);
}