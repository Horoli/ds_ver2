import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<Response<dynamic>> get(String path, {Map<String, dynamic>? query});
  Future<Response<dynamic>> post(String path,
      {Object? data, Map<String, dynamic>? query});
}

class DioApiClient implements ApiClient {
  final Dio dio;
  DioApiClient(this.dio);

  @override
  Future<Response> get(String path, {Map<String, dynamic>? query}) =>
      dio.get(path, queryParameters: query);

  @override
  Future<Response> post(String path,
          {Object? data, Map<String, dynamic>? query}) =>
      dio.post(path, data: data, queryParameters: query);
}

final defaultDio = Dio(
  BaseOptions(
    baseUrl: 'https://mvpdsapi.dailyschool.co.kr/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
);
