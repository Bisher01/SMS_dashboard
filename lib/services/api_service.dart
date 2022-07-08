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

  //============TEACHER=========//
  //all teachers
  @GET('teacher/all')
  Future<FTeacher> getAllTeachers();

  //add teacher
  @POST('teacher/add')
  Future<FTeacher> addTeacher(@Body() FormData formData);

  //edit teacher
  @POST('teacher/edit/{id}')
  Future<FTeacher> editTeacher(@Body() FormData formData, @Path('id') int id);

  //delete teacher
  @DELETE('teacher/delete/{id}')
  Future<Delete> deleteTeacher(@Path('id') int id);
  //=================================================//

  //============STUDENT=========//
  //all students
  @GET('student/all')
  Future<FStudent> getAllStudents();

  //add student
  @POST('student/add')
  Future<FStudent> addStudent(@Body() FormData formData);

  //edit student
  @POST('student/edit/{id}')
  Future<FStudent> editStudent(@Body() FormData formData, @Path('id') int id);

  //delete student
  @DELETE('student/delete/{id}')
  Future<Delete> deleteStudent(@Path('id') int id);
  //=================================================//

  //============SUBJECT=========//
  //all subjects
  @GET('subject/all')
  Future<FSubject> getAllSubjects();

  //add subject
  @POST('subject/add')
  Future<FSubject> addSubject(@Body() FormData formData);

  //edit subject
  @POST('subject/edit/{id}')
  Future<FSubject> editSubject(@Body() FormData formData, @Path('id') int id);

  //delete subject
  @DELETE('subject/delete/{id}')
  Future<Delete> deleteSubject(@Path('id') int id);
  //=================================================//

  //============MENTOR=========//
  //all mentors
  @GET('mentor/all')
  Future<FMentor> getAllMentors();

  //add mentor
  @POST('mentor/add')
  Future<FMentor> addMentor(@Body() FormData formData);

  //edit mentor
  @POST('mentor/edit/{id}')
  Future<FMentor> editMentor(@Body() FormData formData, @Path('id') int id);

  //delete mentor
  @DELETE('mentor/delete/{id}')
  Future<Delete> deleteMentor(@Path('id') int id);
  //=================================================//

  //============CLASSROOM=========//
  //all classrooms
  @GET('classroom/all')
  Future<FClassroom> getAllClassrooms();

  //add classroom
  @POST('classroom/add')
  Future<FClassroom> addClassroom(@Body() FormData formData);

  //edit classroom
  @POST('classroom/edit/{id}')
  Future<FClassroom> editClassroom(
      @Body() FormData formData, @Path('id') int id);

  //delete classroom
  @DELETE('classroom/delete/{id}')
  Future<Delete> deleteClassroom(@Path('id') int id);
  //=================================================//

  //admin authentication
  @POST('admin')
  Future<FAdmin> login(@Body() FormData formData);
  //=================================================//

  //============YEAR=========//
  //add academic year
  @POST('AcademicYear/add')
  Future<FAcademicYears> addAcademicYear(@Body() FormData formData);

  //edit academic year
  @POST('AcademicYear/update/{id}')
  Future<FAcademicYears> editAcademicYear(
      @Body() FormData formData, @Path('id') int id);

  //delete academic year
  @DELETE('AcademicYear/delete/{id}')
  Future<Delete> deleteAcademicYear(@Path('id') int id);
  //=================================================//

  //get seed
  @GET('general/allSeed')
  Future<FSeed> getSeed();

  //edit parent
  @POST('parent/edit/{id}')
  Future<FParent> editParent(@Body() FormData formData, @Path('id') int id);

//============Management=========//

  @POST('management/add/lessons/{id}')
  Future<Delete> addLessonsToDay(@Body() FormData formData, @Path('id') int id);

  @POST('management/add/subject/{id}')
  Future<Delete> addSubjectsToTeacher(
      @Body() FormData formData, @Path('id') int id);

  @POST('management/add/ClassroomToClass/{id}')
  Future<Delete> addClassroomToClass(
      @Body() FormData formData, @Path('id') int id);

  @POST('/management/subject/{id}')
  Future<Delete> addSubjectsToClass(
      @Body() FormData formData, @Path('id') int id);

//=================================================//

//============Exams=========//

//get all exams
  @GET('exam/all')
  Future<FExam> getAllExams();
//=================================================//

//============Syllabi=========//
//get all syllabi
  @GET('syllabi/all')
  Future<FSyllabi> getAllSyllabi();
//=================================================//

}
