import '../client/dio_client_config.dart';
import '../model/base_response.dart';
import '../model/group_member.dart';

class UserService{
  static Future<List<GroupMember>> getUserByGroupId(int groupId) async {
    List<GroupMember> result = [
      GroupMember(1,"1","Kien Pham","mail",null, 2),
      GroupMember(2,"1","Pham Kien","mail",null, 2),
      GroupMember(3,"1","Kien Kien","mail",null, 2),
    ];
    try{
      await DioClient.dio.get("/e/users/group/$groupId").then((response) {
        if(response.statusCode == 200){
          BaseResponse res = BaseResponse.fromJson(response.data);
          List jsonList = res.data as List;
          List<GroupMember> members = jsonList.map((e) => GroupMember.fromJson(e)).toList();
          result.addAll(members);
        }else{
          throw Exception(response);
        }
      });
    }catch(ex, stackTrace){
      print(stackTrace);
      print("error: $ex");
    }
    return result;
  }
}