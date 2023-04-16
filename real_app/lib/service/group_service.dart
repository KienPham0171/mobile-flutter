
import '../client/dio_client_config.dart';
import '../model/base_response.dart';
import '../model/group.dart';
class GroupService {

    static Future<List<Group>> getGroup() async {
      List<Group> result = [
        Group(1, "Group 1", "Description"),
        Group(2, "Group 2", "Description"),
      ];
      try{
        await DioClient.dio.get("/e/groups")
          /*  .then((value) async {
          await Future.delayed(Duration(seconds: 5));
          return value;
        })*/
            .then((response) {
          if(response.statusCode == 200){
            BaseResponse res = BaseResponse.fromJson(response.data);
            List jsonList = res.data as List;
            List<Group> groups = jsonList.map((e) => Group.fromJson(e)).toList();
            result.addAll(groups);
          }else{
            throw Exception(response);
          }
        });
      }catch(ex,prinstacktrace){
        print(prinstacktrace);
        print("error when all api: $ex");
        // return [];
      }
      print("result: $result");
      return result;
    }
}