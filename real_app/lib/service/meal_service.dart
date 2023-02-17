
import 'package:real_app/client/dio_client_config.dart';
import 'package:real_app/dto/request/create_meal_request.dart';
import '../model/base_response.dart';


class MealService{
  static Future<BaseResponse> createMeal(CreateMealRequest bodyData) async {

    try{
        final res = await DioClient.dio.post("/e/foods",data: bodyData.toJson());
        print("res: $res");
        return BaseResponse.fromJson(res.data);
    }catch(ex,stacktrace){
      print(stacktrace);
      print("MailService error: $ex");
      return BaseResponse(false,'',null);
    }
    // return BaseResponse(false,'',null);

  }
}