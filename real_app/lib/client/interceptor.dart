import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }
}


class SecurityInterceptor extends Interceptor{
  final String hardToken =
      "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJraWVuLnB0IiwidHlwZSI6MSwiZXhwIjoxNjc2ODkzMzIyLCJpYXQiOjE2NzY4NjQ1MjJ9.N6XXuZYVqoR9lMdZS4lnEsVj7z1rjJbzTA658snREyHuXVCZAVnsg6JtbLxeF2mJx3bbpLatq9w4vNrlIRTO4v7tRa20VAjN7p_hSWre_MMP1I-9JvIzUW9qDcVKdeUPSjsEAR4ZOCY6XHhpqzV9bzfJXwflqzkppTwMBRNFSpaPwIW-hwunLlqtIGo57ZcsGQvDqfDcQbcp4d8QlDBHX6_aqO91d0PVsLNce_X_ILsmv9Dl4ZlAfuuMzshQsYq7OdpKSI6F7y3b-t30WZ4g4qsf6biEXhdLZt5YkkU3QGdqnpdrdh5UhnP352X5vMXuVgArU8e3NHGmThbKbFU9950ejh-ssT2zEbr1QVVN_A6TjlpQd22cNJUn7czVvSHlA_RWx0mL_X69wIWCp7MAclmSq8rlrI6oSjz6l5bKochEEqY9UAszdmiISDUc84u92foj0TonUSdfTAzweu_jH7gXV9OqG_50hOAMM0W70Ka2cuRmBQuBNHNdg0gD9D66j4hOU7cwEFM4Ngwo0i8kAbXG_wE-N3_VL9FDATOlov0DmTiy2NFVkrLs8LXVHii_-3zWvQuwONhPbogSz6kJgdL2uu1KX2iQkvUgfAJrG-ND9HyJjdDN4t2alZ93rblECRB6mzLRNsK7u1LIT71xrF9AI483wuxkIR6YSZx-tlg";
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final _prefs = await SharedPreferences.getInstance();
    String accessToken = _prefs.getString("accessToken") ?? hardToken;
    if(options.path.startsWith("/e/")){
      // Gắn access_token vào header, gửi kèm access_token trong header mỗi khi call API
      options.headers['Authorization'] = "Bearer $accessToken";
      return handler.next(options);
    }


    /* if (!options.path.contains('http')) {
      // Cấu hình đường path để call api, thành phần gồm
      // - Enviroment.api: Enpoint api theo môi trường, có thể dùng package dotenv
      // để cấu hình biến môi trường. Ví dụ: https://api-tech.com/v1
      // - options.path: đường dẫn cụ thể API. Ví dụ: "user/user-info"

      options.path = Enviroment.apiUrl + options.path;
    }

    // Lấy các token được lưu tạm từ local storage
    String? accessToken = _prefs.getString('accessToken');
    String? expiredTime = _prefs.getString('expiredTime');
    String? refreshToken = _prefs.getString('refreshToken');

    // Kiểm tra xem user có đăng nhập hay chưa. Nếu chưa thì call handler.next(options)
    // để trả data về tiếp client
    if (accessToken == null || expiredTime == null || refreshToken == null) {
      return handler.next(options);
    }

    // Tính toán thời gian token expired
    final expiredTimeConvert = DateTime.parse(expiredTime);
    final isExpired = DateTime.now().isAfter(expiredTimeConvert);

    if (isExpired) {
      try {
        final response = await dio.post(
          'https://api-tech.com/v1/auth/user-refresh-token',
          data: refreshToken,
        );
        if (response.statusCode == 200) {
          //! EXPIRED SESSION
          if (response.data != false) {
            options.headers['Authorization'] =
            "Bearer ${response.data["accessToken"]}";
            final expiredTime = DateTime.now()
                .add(Duration(seconds: response.data["expiresIn"] - 240));
            await _prefs.setString(
                "accessToken", response.data["accessToken"]);
            await _prefs.setString("expiredTime", expiredTime.toString());
          } else {
            logout();
          }
        } else {
          logout();
        }
        return handler.next(options);
      } on DioError catch (error) {
        logout();
        return handler.reject(error, true);
      }
    } else {
      // Gắn access_token vào header, gửi kèm access_token trong header mỗi khi call API
      options.headers['Authorization'] = "Bearer $accessToken";
      return handler.next(options);
    }
  }*/
  }
}