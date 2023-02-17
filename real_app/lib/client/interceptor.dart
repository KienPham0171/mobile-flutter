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
  final String hardToken = "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJraWVuLnB0IiwidHlwZSI6MSwiZXhwIjoxNjc2NjQzMzMxLCJpYXQiOjE2NzY2MTQ1MzF9.RWYcSBAMa2t6TMQee511UFIP8PT_LWLiepc-BRmWiC5lF3XTAhFOUIk2SrBbAeJqBO7MlGHxM1k6-7dJOJWNdAFfkDm_2-o-qjroHwwM3nWda-s1hGFbzV-uXf_M65ET8iUB9nPabjh8WG0dZB_mEbEp_eoQ8FRdC9SBEkszFFBP4IyZqWbeGnTG4piuV2KaW8lWYn3azmphzGEg_KD3w0ePnh3kRonc6e--ACXrkKrq5RgyvarMkOHRndglG_2fKQx2l8Vsba4YZD3lmp06lSxhtTGq3o2eRMN5dEzfTQlyF5kOqdueU24y4E1WQ_uqG0o-dO_gdQzbVIC9lnXYe9MEzwbdROoHFw0ixVvxGsZbksLGjo0WlQmjIw3hnMrFs5ha_8-dRp4tdomcdzQzIk5Q_ykNW68-JMRnrX9sEgy413NPYTeI6yzAgVKKXJOEBL3H6ARdQchDi8cZkjeGNIDLksTC2JTyf4cuShSYX6t-rt3hhAYkhRTmfs9Msmq5elXgHjIXTSYH1kN7fJa9pJ4dXs_iTLBhp_HFNMosWryxY_7sUhNQroyp8Ai9gu3Ux8_NoeNzkenZXWM5bthTPxFCEj3lrHx8rq1aERc8e4psdNI9ewrF-63QxgbV8tdkDQYXWOYWVz4hrVkLpZpxCb-FV5eZtTWLodF6CzDH08A";
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