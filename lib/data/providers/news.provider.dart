import 'package:dio/dio.dart';

class DioProvider {
  static String baseUrl = 'https://newsapi.org/';
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true));
    dio.interceptors.add(LogInterceptor(requestBody: true));
  }

  Future<Response> get({String url, Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
