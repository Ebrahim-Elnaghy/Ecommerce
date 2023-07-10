

import 'package:dio/dio.dart';

import 'home_data_sources.dart';

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

  HomeRemoteDto() {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }


}
