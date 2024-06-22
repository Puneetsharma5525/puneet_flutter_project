import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_project/core/Api/ApiUrl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  static BaseOptions _options() {
    return BaseOptions(
      baseUrl: ApiUrl.barUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
  }

  Dio dioClient() {
    Dio dio = Dio(_options());
    // if (kDebugMode) {
    //   // print the api call log data
    //   dio.interceptors.add(PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseBody: true,
    //       responseHeader: false,
    //       error: true,
    //       compact: true,
    //       request: true,
    //       maxWidth: 1600));
    // }
    return dio;
  }
}
