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
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return _ApiService(dio, baseUrl: baseUrl);
  }
  //all teachers
  @GET('teacher/all')
  Future<FTeacher> getAllTeachers();

  //all students
  @GET('student/all')
  Future<FStudent> getAllStudents();

  //all subjects
  @GET('subject/all')
  Future<FSubject> getAllSubjects();

  //all mentors
  @GET('mentor/all')
  Future<FMentor> getAllMentors();

  //all classrooms
  @GET('classroom/all')
  Future<FClassroom> getAllClassrooms();

  //admin authentication
  @POST('admin')
  Future<FAdmin> login(@Body() FormData formData);

  //add mentor
  @POST('mentor/add')
  Future<FMentor> addMentor(@Body() FormData formData);

  //add student
  @POST('student/add')
  Future<FStudent> addStudent(@Body() FormData formData);

  //add teacher
  @POST('teacher/add')
  Future<FTeacher> addTeacher(@Body() FormData formData);

  //add academic year
  @POST('AcademicYear/add')
  Future<FAcademicYears> addAcademicYear(@Body() FormData formData);

  //add subject
  @POST('subject/add')
  Future<FSubject> addSubject(@Body() FormData formData);

  //add classroom
  @POST('classroom/add')
  Future<FClassroom> addClassroom(@Body() FormData formData);

  //edit student
  @POST('student/edit/{id}')
  Future<FStudent> editStudent(@Body() FormData formData, @Path('id') int id);

  //delete student
  @DELETE('student/delete/{id}')
  Future deleteStudent(@Path('id') int id);

  //edit teacher
  @POST('teacher/edit/{id}')
  Future<FTeacher> editTeacher(@Body() FormData formData, @Path('id') int id);

  //delete teacher
  @DELETE('teacher/delete/{id}')
  Future deleteTeacher(@Path('id') int id);

  //edit academic year
  @POST('AcademicYear/update/{id}')
  Future<FAcademicYears> editAcademicYear(
      @Body() FormData formData, @Path('id') int id);

  //delete academic year
  @DELETE('AcademicYear/delete/{id}')
  Future deleteAcademicYear(@Path('id') int id);

  //edit mentor
  @POST('mentor/edit/{id}')
  Future<FMentor> editMentor(@Body() FormData formData, @Path('id') int id);

  //delete mentor
  @DELETE('mentor/delete/{id}')
  Future deleteMentor(@Path('id') int id);

  //edit classroom
  @POST('classroom/edit/{id}')
  Future<FClassroom> editClassroom(
      @Body() FormData formData, @Path('id') int id);

  //delete classroom
  @DELETE('classroom/delete/{id}')
  Future deleteClassroom(@Path('id') int id);

  //edit subject
  @POST('subject/edit/{id}')
  Future<FSubject> editSubject(@Body() FormData formData, @Path('id') int id);

  //delete subject
  @DELETE('subject/delete/{id}')
  Future deleteSubject(@Path('id') int id);

  //get seed
  @GET('general/allSeed')
  Future<FSeed> getSeed();

  //edit parent
  @POST('parent/edit/{id}')
  Future<FParent> editParent(@Body() FormData formData, @Path('id') int id);
}
