
import 'package:real_app/model/notification/notification.dart';

import '../client/dio_client_config.dart';
import '../model/base_response.dart';

class NotificationService{
  static Future<List<NotificationObj>> getNotifications() async {
    List<NotificationObj> result = [
    ];
    try{
      await DioClient.dio.get("/p/noties")
          .then((response) {
        if(response.statusCode == 200){
          BaseResponse res = BaseResponse.fromJson(response.data);
          List jsonList = res.data as List;
          List<NotificationObj> noties = jsonList.map((e) => NotificationObj.fromJson(e)).toList();
          result.addAll(noties);
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