import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/api_response.dart';
import '../services/api_service.dart';
import '../models/models.dart';
import '../services/api_exception.dart';

class AppProvider extends ChangeNotifier {
  //check connection
  bool isConnected = false;
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected = connectivityResult != ConnectivityResult.none;
    return isConnected;
  }

  //get all teachers
  ApiResponse<FTeacher>? _fTeacherResponse;
  ApiResponse<FTeacher>? get fTeacherResponse => _fTeacherResponse;
  set fTeacherResponse(ApiResponse<FTeacher>? value) {
    _fTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> getAllTeachers() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher teacher = await apiService.getAllTeachers();
        fTeacherResponse = ApiResponse.completed(teacher);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fTeacherResponse = ApiResponse.error('No Internet Connection');
    }
    return fTeacherResponse!;
  }

  //get all students
  ApiResponse<FStudent>? _fStudentResponse;
  ApiResponse<FStudent>? get fStudentResponse => _fStudentResponse;
  set fStudentResponse(ApiResponse<FStudent>? value) {
    _fStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> getAllStudents() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fStudentResponse = ApiResponse.loading('');
      try {
        FStudent fStudent = await apiService.getAllStudents();
        fStudentResponse = ApiResponse.completed(fStudent);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fStudentResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fStudentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fStudentResponse = ApiResponse.error('No Internet Connection');
    }
    return fStudentResponse!;
  }

  //get all subjects
  ApiResponse<FSubject>? _fSubjectResponse;
  ApiResponse<FSubject>? get fSubjectResponse => _fSubjectResponse;
  set fSubjectResponse(ApiResponse<FSubject>? value) {
    _fSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> getAllSubjects() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fSubjectResponse = ApiResponse.loading('');
      try {
        FSubject fSubject = await apiService.getAllSubjects();
        fSubjectResponse = ApiResponse.completed(fSubject);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fSubjectResponse = ApiResponse.error(forcedException.toString());
          }
        }
        fSubjectResponse = ApiResponse.error(e.toString());
      }
    } else {
      return fSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fSubjectResponse!;
  }

  //get all mentors
  ApiResponse<FMentor>? _fMentorResponse;
  ApiResponse<FMentor>? get fMentorResponse => _fMentorResponse;
  set fMentorResponse(ApiResponse<FMentor>? value) {
    _fMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> getAllMentors() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fMentorResponse = ApiResponse.loading('');
      try {
        FMentor fMentor = await apiService.getAllMentors();
        fMentorResponse = ApiResponse.completed(fMentor);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fMentorResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fMentorResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fMentorResponse!;
  }

  //admin authentication
  ApiResponse<FAdmin>? _fAdminResponse;
  ApiResponse<FAdmin>? get fAdminResponse => _fAdminResponse;
  set fAdminResponse(ApiResponse<FAdmin>? value) {
    _fAdminResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FAdmin>> login(String email, String password) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
        FormData.fromMap({'email': email, 'password': password});
    if (await checkInternet()) {
      fAdminResponse = ApiResponse.loading('');
      try {
        FAdmin admin = await apiService.login(formData);
        fAdminResponse = ApiResponse.completed(admin);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAdminResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAdminResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAdminResponse = ApiResponse.error('No Internet Connection');
    }
    return fAdminResponse!;
  }

  //add mentor
  ApiResponse<FMentor>? _fAddMentorResponse;
  ApiResponse<FMentor>? get fAddMentorResponse => _fAddMentorResponse;
  set fAddMentorResponse(ApiResponse<FMentor>? value) {
    _fAddMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> addMentor(
      String email,
      String f_name,
      String l_name,
      String address_id,
      String joining_date,
      String phone,
      String class_id,
      String city,
      String town,
      String street) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'address_id': address_id,
      'joining_date': joining_date,
      'phone': phone,
      'class_id': class_id,
      'city': city,
      'town': town,
      'street': street
    });
    if (await checkInternet()) {
      fAddMentorResponse = ApiResponse.loading('');
      try {
        FMentor mentor = await apiService.addMentor(formData);
        fAddMentorResponse = ApiResponse.completed(mentor);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddMentorResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddMentorResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddMentorResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddMentorResponse!;
  }

  //get all classrooms
  ApiResponse<FClassroom>? _fClassrooms;
  ApiResponse<FClassroom>? get fClassroomResponse => _fClassrooms;
  set fClassroomResponse(ApiResponse<FClassroom>? value) {
    _fClassrooms = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> getAllClassrooms() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fClassroomResponse = ApiResponse.loading('');
      try {
        FClassroom fClassroom = await apiService.getAllClassrooms();
        fClassroomResponse = ApiResponse.completed(fClassroom);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fClassroomResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fClassroomResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fClassroomResponse!;
  }

  //add student
  ApiResponse<FStudent>? _fAddStudentResponse;
  ApiResponse<FStudent>? get fAddStudentResponse => _fAddStudentResponse;
  set fAddStudentResponse(ApiResponse<FStudent>? value) {
    _fAddStudentResponse = value;
    notifyListeners();
  }

  ///TODO: other add student request when he has no siblings
  Future<ApiResponse<FStudent>> addStudent(

      ///TODO: not string
      String picture,
      String email,
      String f_name,
      String l_name,
      String nationality,

      ///TODO: not string
      String birthdate,
      String blood_id,
      String gender_id,
      String religion_id,
      String grade_id,
      String class_id,
      String classroom_id,
      String academic_year_id,
      String national_number,
      String city,
      String town,
      String street) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'nationality': nationality,
      'birthdate': birthdate,
      'blood_id': blood_id,
      'gender_id': gender_id,
      'religion_id': religion_id,
      'grade_id': grade_id,
      'class_id': class_id,
      'classroom_id': classroom_id,
      'academic_year_id': academic_year_id,
      'national_number': national_number,
      'city': city,
      'town': town,
      'street': street
    });
    if (await checkInternet()) {
      fAddStudentResponse = ApiResponse.loading('');
      try {
        FStudent student = await apiService.addStudent(formData);
        fAddStudentResponse = ApiResponse.completed(student);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddStudentResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddStudentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddStudentResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddStudentResponse!;
  }

  //add teacher
  ApiResponse<FTeacher>? _fAddTeacherResponse;
  ApiResponse<FTeacher>? get fAddTeacherResponse => _fAddTeacherResponse;
  set fAddTeacherResponse(ApiResponse<FTeacher>? value) {
    _fAddTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> addTeacher(

      ///TODO: not string
      String picture,
      String email,
      String f_name,
      String l_name,

      ///TODO: not string
      String joining_date,
      int salary,
      String gender_id,
      String religion_id,
      String grade_id,
      String subject_id,
      String city,
      String town,
      String street) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'joining_date': joining_date,
      'salary': salary,
      'gender_id': gender_id,
      'religion_id': religion_id,
      'grade_id': grade_id,
      'city': city,
      'town': town,
      'street': street,
      'subject_id': subject_id
    });
    if (await checkInternet()) {
      fAddTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher teacher = await apiService.addTeacher(formData);
        fAddTeacherResponse = ApiResponse.completed(teacher);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddTeacherResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddTeacherResponse!;
  }

  //add academic year
  ApiResponse<FAcademicYears>? _fAddYearResponse;
  ApiResponse<FAcademicYears>? get fAddYearResponse => _fAddYearResponse;
  set fAddYearResponse(ApiResponse<FAcademicYears>? value) {
    _fAddYearResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FAcademicYears>> addAcademicYear(
    ///TODO: not string
    String date,
  ) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'date': date,
    });
    if (await checkInternet()) {
      fAddYearResponse = ApiResponse.loading('');
      try {
        FAcademicYears year = await apiService.addAcademicYear(formData);
        fAddYearResponse = ApiResponse.completed(year);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddYearResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddYearResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddYearResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddYearResponse!;
  }

  //add subject
  ApiResponse<FSubject>? _fAddSubjectResponse;
  ApiResponse<FSubject>? get fAddSubjectResponse => _fAddSubjectResponse;
  set fAddSubjectResponse(ApiResponse<FSubject>? value) {
    _fAddSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> addSubject(
    String subject_name,
  ) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'subject_name': subject_name,
    });
    if (await checkInternet()) {
      fAddSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.addSubject(formData);
        fAddSubjectResponse = ApiResponse.completed(subject);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddSubjectResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddSubjectResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddSubjectResponse!;
  }

  //add classroom
  ApiResponse<FClassroom>? _fAddclassroomResponse;
  ApiResponse<FClassroom>? get fAddclassroomResponse => _fAddclassroomResponse;
  set fAddclassroomResponse(ApiResponse<FClassroom>? value) {
    _fAddclassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> addClassroom(
      String name, String max_number) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
        FormData.fromMap({'name': name, 'max_number': max_number});
    if (await checkInternet()) {
      fAddclassroomResponse = ApiResponse.loading('');
      try {
        FClassroom classroom = await apiService.addClassroom(formData);
        fAddclassroomResponse = ApiResponse.completed(classroom);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddclassroomResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddclassroomResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddclassroomResponse =
          ApiResponse.error('No Internet Connection');
    }
    return fAddclassroomResponse!;
  }

  //edit student
  ApiResponse<FStudent>? _fEditStudentResponse;
  ApiResponse<FStudent>? get fEditStudentResponse => _fEditStudentResponse;
  set fEditStudentResponse(ApiResponse<FStudent>? value) {
    _fEditStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> editStudent(

      ///TODO: not string
      String picture,
      String email,
      String f_name,
      String l_name,
      String nationality_id,

      ///TODO: not string
      String birthdate,
      String blood_id,
      String gender_id,
      String religion_id,
      String grade_id,
      String class_id,
      String parent_id,
      String classroom_id,
      String academic_year_id,
      String city,
      String town,
      String street,
      int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'nationality_id': nationality_id,
      'birthdate': birthdate,
      'parent_id': parent_id,
      'blood_id': blood_id,
      'gender_id': gender_id,
      'religion_id': religion_id,
      'grade_id': grade_id,
      'class_id': class_id,
      'classroom_id': classroom_id,
      'academic_year_id': academic_year_id,
      'city': city,
      'town': town,
      'street': street,
      '_method': 'put'
    });
    if (await checkInternet()) {
      fEditStudentResponse = ApiResponse.loading('');
      try {
        FStudent student = await apiService.editStudent(formData, id);
        fEditStudentResponse = ApiResponse.completed(student);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditStudentResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditStudentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditStudentResponse = ApiResponse.error('No Internet Connection');
    }
    return fEditStudentResponse!;
  }

  //edit teacher
  ApiResponse<FTeacher>? _fEditTeacherResponse;
  ApiResponse<FTeacher>? get fEditTeacherResponse => _fEditTeacherResponse;
  set fEditTeacherResponse(ApiResponse<FTeacher>? value) {
    _fEditTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> editTeacher(

      ///TODO: not string
      String picture,
      String email,
      String f_name,
      String l_name,

      ///TODO: not string
      String joining_date,
      String gender_id,
      String religion_id,
      String grade_id,
      String city,
      String town,
      int salary,
      String street,
      int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'joining_date': joining_date,
      'gender_id': gender_id,
      'religion_id': religion_id,
      'grade_id': grade_id,
      'city': city,
      'town': town,
      'street': street,
      'salary': salary,
      '_method': 'put'
    });
    if (await checkInternet()) {
      fEditTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher teacher = await apiService.editTeacher(formData, id);
        fEditTeacherResponse = ApiResponse.completed(teacher);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditTeacherResponse = ApiResponse.error('No Internet Connection');
    }
    return fEditTeacherResponse!;
  }

  //edit academic year
  ApiResponse<FAcademicYears>? _fEditAcademicYearResponse;
  ApiResponse<FAcademicYears>? get fEditAcademicYearResponse =>
      _fEditAcademicYearResponse;
  set fEditAcademicYearResponse(ApiResponse<FAcademicYears>? value) {
    _fEditAcademicYearResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FAcademicYears>> editAcademicYear(

      ///TODO: not string
      String date,
      int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      '_method': 'PUT',
      'date': date,
    });
    if (await checkInternet()) {
      fEditAcademicYearResponse = ApiResponse.loading('');
      try {
        FAcademicYears academicYears =
            await apiService.editAcademicYear(formData, id);
        fEditAcademicYearResponse = ApiResponse.completed(academicYears);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditAcademicYearResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditAcademicYearResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditAcademicYearResponse =
          ApiResponse.error('No Internet Connection');
    }
    return fEditAcademicYearResponse!;
  }

  //edit mentor
  ApiResponse<FMentor>? _fEditMentorResponse;
  ApiResponse<FMentor>? get fEditMentorResponse => _fEditMentorResponse;
  set fEditMentorResponse(ApiResponse<FMentor>? value) {
    _fEditMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> editMentor(
      String email,
      String f_name,
      String l_name,

      ///TODO: not string
      String joining_date,
      String address_id,
      String class_id,
      String phone,
      String city,
      String town,
      String street,
      int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'joining_date':joining_date,
      'address_id':address_id,
      'class_id':class_id,
      'phone':phone,
      '_method': 'PUT',
      'city': city,
      'town': town,
      'street': street,
    });
    if (await checkInternet()) {
      fEditMentorResponse = ApiResponse.loading('');
      try {
        FMentor mentor = await apiService.editMentor(formData, id);
        fEditMentorResponse = ApiResponse.completed(mentor);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditMentorResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditMentorResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditMentorResponse = ApiResponse.error('No Internet Connection');
    }
    return fEditMentorResponse!;
  }

  //edit classroom
  ApiResponse<FClassroom>? _fEditClassroomResponse;
  ApiResponse<FClassroom>? get fEditClassroomResponse => _fEditClassroomResponse;
  set fEditClassroomResponse(ApiResponse<FClassroom>? value) {
    _fEditClassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> editClassroom(
      String name, String max_number,int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
    FormData.fromMap({'name': name, 'max_number': max_number,'method':'PUT'});
    if (await checkInternet()) {
      fEditClassroomResponse = ApiResponse.loading('');
      try {
        FClassroom classroom = await apiService.editClassroom(formData,id);
        fEditClassroomResponse = ApiResponse.completed(classroom);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditClassroomResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditClassroomResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditClassroomResponse =
          ApiResponse.error('No Internet Connection');
    }
    return fEditClassroomResponse!;
  }

  //edit subject
  ApiResponse<FSubject>? _fEditSubjectResponse;
  ApiResponse<FSubject>? get fEditSubjectResponse => _fEditSubjectResponse;
  set fEditSubjectResponse(ApiResponse<FSubject>? value) {
    _fEditSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> editSubject(
       String subject_name,int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
    FormData.fromMap({ 'subject_name': subject_name,'method':'PUT'});
    if (await checkInternet()) {
      fEditSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.editSubject(formData,id);
        fEditSubjectResponse = ApiResponse.completed(subject);
      } catch (e, stackTrace) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditSubjectResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditSubjectResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditSubjectResponse =
          ApiResponse.error('No Internet Connection');
    }
    return fEditSubjectResponse!;
  }
}

dynamic throwCustomException(DioError? dioError) {
  var statusCode = dioError?.response?.statusCode;
  switch (dioError!.type) {
    case DioErrorType.cancel:
      throw RequestWasCancelledException("CANCEL");
      break;
    case DioErrorType.connectTimeout:
      throw ConnectionTimeout("CONNECT_TIMEOUT");
      break;
    case DioErrorType.other:
      throw DefaultTimeout("DEFAULT");
      break;
    case DioErrorType.receiveTimeout:
      throw ReceiveTimeout("RECEIVE_TIMEOUT");
      break;
    case DioErrorType.sendTimeout:
      throw SendTimeout("SEND_TIMEOUT");
      break;
    case DioErrorType.response:
      switch (statusCode) {
        case 400:
          throw BadRequestException(dioError.response?.statusMessage);
          break;
        case 401:
        case 403:
          throw UnauthorisedException(dioError.response?.statusMessage);
          break;
        case 404:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
          break;
        case 500:
        default:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
      }
      break;
  }
}
