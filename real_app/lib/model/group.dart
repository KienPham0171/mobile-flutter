class Group{
  int id;
  String groupName;
  String groupDesc;
  bool isExpanded;

  Group(this.id, this.groupName, this.groupDesc,{this.isExpanded = false});
}