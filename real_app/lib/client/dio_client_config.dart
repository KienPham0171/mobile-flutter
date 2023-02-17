import 'package:dio/dio.dart';
import 'package:real_app/client/interceptor.dart';
import 'package:real_app/config/apis.dart';
import 'package:real_app/config/config.dart';

class DioClient {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: DIO_CONNECT_TIMEOUT,
    receiveTimeout: DIO_RECEIVE_TIMEOUT,
    contentType: "application/json",

  ))..interceptors.addAll([LoggingInterceptor(),SecurityInterceptor()]);
}




