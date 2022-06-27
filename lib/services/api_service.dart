import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/models.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {BuildContext? context, String? baseUrl}) {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // options.connectTimeout = 60000;
      // options.receiveTimeout = 60000;
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {}
      return handler.next(error);
    }));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody:  true,
      responseBody: true,
      responseHeader: true,
      error:  true,
      compact: true,
      maxWidth: 90,
    ));
    return _ApiService(dio,baseUrl: baseUrl);
  }
  @GET('teacher/all')
  Future <FTeacher> getAllTeachers();

  @GET('student/all')
  Future<FStudent> getAllStudents();

  @GET('subject/all')
  Future<FSubject> getAllSubjects();
}
