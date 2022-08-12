import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import '../services/api_response.dart';
import '../services/api_service.dart';
import '../models/models.dart';
import '../services/api_exception.dart';

class AppProvider extends ChangeNotifier {
  //token box
  void setToken(String token) {
    var box = Boxes.getAuthBox();
    //box.clear();
    box.put('token', token);
    notifyListeners();
  }

  //check connection
  bool isConnected = false;
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected = connectivityResult != ConnectivityResult.none;
    return isConnected;
  }

  ///=====================TEACHER=====================///
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
      } catch (e) {
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

  //add teacher
  ApiResponse<FTeacher>? _fAddTeacherResponse;
  ApiResponse<FTeacher>? get fAddTeacherResponse => _fAddTeacherResponse;
  set fAddTeacherResponse(ApiResponse<FTeacher>? value) {
    _fAddTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> addTeacher(
      String picture,
      String email,
      String fName,
      String lName,
      String joiningDate,
      String salary,
      int genderId,
      int religionId,
      String city,
      String town,
      String street) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': fName,
      'l_name': lName,
      'joining_date': joiningDate,
      'salary': salary,
      'gender_id': genderId,
      'religion_id': religionId,
      'city': city,
      'town': town,
      'street': street,
    });
    if (await checkInternet()) {
      fAddTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher teacher = await apiService.addTeacher(formData);
        fAddTeacherResponse = ApiResponse.completed(teacher);
      } catch (e) {
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

  //edit teacher
  ApiResponse<FTeacher>? _fEditTeacherResponse;
  ApiResponse<FTeacher>? get fEditTeacherResponse => _fEditTeacherResponse;
  set fEditTeacherResponse(ApiResponse<FTeacher>? value) {
    _fEditTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> editTeacher(
      {String? picture,
      required String email,
      required String fName,
      required String lName,
      required String joiningDate,
      required int genderId,
      required int religionId,
      required String city,
      required String town,
      required String salary,
      required String street,
      required int id}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = picture != null
        ? FormData.fromMap({
            'picture': picture,
            'email': email,
            'f_name': fName,
            'l_name': lName,
            'joining_date': joiningDate,
            'gender_id': genderId,
            'religion_id': religionId,
            'city': city,
            'town': town,
            'street': street,
            'salary': salary,
            '_method': 'put'
          })
        : FormData.fromMap({
            'email': email,
            'f_name': fName,
            'l_name': lName,
            'joining_date': joiningDate,
            'gender_id': genderId,
            'religion_id': religionId,
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
      } catch (e) {
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

  //delete teacher
  ApiResponse<Delete>? _deleteTeacherResponse;
  ApiResponse<Delete>? get deleteTeacherResponse => _deleteTeacherResponse;
  set deleteTeacherResponse(ApiResponse<Delete>? value) {
    _deleteTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteTeacher(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteTeacherResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteTeacher(id);
        deleteTeacherResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return deleteTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteTeacherResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteTeacherResponse!;
  }

  ///=====================STUDENT=====================///
  //get all students
  ApiResponse<FStudent>? _fStudentResponse;
  ApiResponse<FStudent>? get fStudentResponse => _fStudentResponse;
  set fStudentResponse(ApiResponse<FStudent>? value) {
    _fStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> getAllStudents(
      {String? name, String? order}) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fStudentResponse = ApiResponse.loading('');
      FormData formData = FormData.fromMap({
        'searchByName': name ?? '',
        'orderBy': order ?? '',
      });
      try {
        FStudent fStudent = await apiService.getAllStudents(formData);
        fStudentResponse = ApiResponse.completed(fStudent);
      } catch (e) {
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

  //add student
  ApiResponse<FStudent>? _fAddStudentResponse;
  ApiResponse<FStudent>? get fAddStudentResponse => _fAddStudentResponse;
  set fAddStudentResponse(ApiResponse<FStudent>? value) {
    _fAddStudentResponse = value;
    notifyListeners();
  }

  ///TODO: other add student request when he has no siblings
  Future<ApiResponse<FStudent>> addStudent(
      {required String? picture,
      required String email,
      required String f_name,
      required String l_name,
      required int nationality,
      required String birthdate,
      required int blood_id,
      required int gender_id,
      required int religion_id,
      required int grade_id,
      required int class_id,
      required int classroom_id,
      required int academic_year_id,
      required String national_number,
      required String city,
      required String town,
      required String street}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'nationality_id': nationality,
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
      } catch (e) {
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

  Future<ApiResponse<FStudent>> addStudentWithParent({
    required String picture,
    required String email,
    required String f_name,
    required String l_name,
    required int nationality,
    required String birthdate,
    required int blood_id,
    required int gender_id,
    required int religion_id,
    required int grade_id,
    required int class_id,
    required int classroom_id,
    required int academic_year_id,
    required String national_number,
    required String city,
    required String town,
    required String street,
    required String mother_name,
    required String father_name,
    required String parentPhone,
    required String parentEmail,
    required String parentJop,
  }) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': f_name,
      'l_name': l_name,
      'nationality_id': nationality,
      'birthdate': birthdate,
      'blood_id': blood_id,
      'gender_id': gender_id,
      'religion_id': religion_id,
      'grade_id': grade_id,
      'class_id': class_id,
      'classroom_id': classroom_id,
      'academic_year_id': academic_year_id,
      'mother_name': mother_name,
      'father_name': father_name,
      'national_number': national_number,
      'parentPhone': parentPhone,
      'parentEmail': parentEmail,
      'parentJop': parentJop,
      'city': city,
      'town': town,
      'street': street
    });
    //formData.files.add(imageEntry);
    if (await checkInternet()) {
      fAddStudentResponse = ApiResponse.loading('');
      try {
        FStudent student = await apiService.addStudent(formData);
        fAddStudentResponse = ApiResponse.completed(student);
      } catch (e) {
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

  //edit student
  ApiResponse<FStudent>? _fEditStudentResponse;
  ApiResponse<FStudent>? get fEditStudentResponse => _fEditStudentResponse;
  set fEditStudentResponse(ApiResponse<FStudent>? value) {
    _fEditStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> editStudent(
      {required String picture,
      required String email,
      required String fName,
      required String lName,
      required int nationalityId,
      required String birthdate,
      required int bloodId,
      required int genderId,
      required int religionId,
      required int gradeId,
      required int classId,
      required int parentId,
      required int classroomId,
      required int academicYearId,
      required String city,
      required String town,
      required String street,
      required int id}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'picture': picture,
      'email': email,
      'f_name': fName,
      'l_name': lName,
      'nationality_id': nationalityId,
      'birthdate': birthdate,
      'parent_id': parentId,
      'blood_id': bloodId,
      'gender_id': genderId,
      'religion_id': religionId,
      'grade_id': gradeId,
      'class_id': classId,
      'classroom_id': classroomId,
      'academic_year_id': academicYearId,
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
      } catch (e) {
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

  //delete student
  ApiResponse<Delete>? _deleteStudentResponse;
  ApiResponse<Delete>? get deleteStudentResponse => _deleteStudentResponse;
  set deleteStudentResponse(ApiResponse<Delete>? value) {
    _deleteStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteStudent(
    int id,
  ) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteStudentResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteStudent(id);
        deleteStudentResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            deleteStudentResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          deleteStudentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteStudentResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteStudentResponse!;
  }

  ///=====================SUBJECT=====================///

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
      } catch (e) {
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

  //add subject
  ApiResponse<FSubject>? _fAddSubjectResponse;
  ApiResponse<FSubject>? get fAddSubjectResponse => _fAddSubjectResponse;
  set fAddSubjectResponse(ApiResponse<FSubject>? value) {
    _fAddSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> addSubject(
      {required String subjectName,
      required int classId,
      required int mark}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'subject_name': subjectName,
      'class_id[0]': classId,
      'mark[0]': mark,
    });
    if (await checkInternet()) {
      fAddSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.addSubject(formData);
        fAddSubjectResponse = ApiResponse.completed(subject);
      } catch (e) {
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

  //edit subject
  ApiResponse<FSubject>? _fEditSubjectResponse;
  ApiResponse<FSubject>? get fEditSubjectResponse => _fEditSubjectResponse;
  set fEditSubjectResponse(ApiResponse<FSubject>? value) {
    _fEditSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> editSubject(String subjectName, int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
        FormData.fromMap({'subject_name': subjectName, 'method': 'PUT'});
    if (await checkInternet()) {
      fEditSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.editSubject(formData, id);
        fEditSubjectResponse = ApiResponse.completed(subject);
      } catch (e) {
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
      return fEditSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fEditSubjectResponse!;
  }

  //delete subject
  ApiResponse<Delete>? _deleteSubjectResponse;
  ApiResponse<Delete>? get deleteSubjectResponse => _deleteSubjectResponse;
  set deleteSubjectResponse(ApiResponse<Delete>? value) {
    _deleteSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteSubject(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteSubjectResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteSubject(id);
        deleteSubjectResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteSubjectResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return deleteSubjectResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteSubjectResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteSubjectResponse!;
  }

  ///=====================MENTOR=====================///
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
      } catch (e) {
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
    } else {
      return fMentorResponse = ApiResponse.error('NO Internet Connection');
    }
    return fMentorResponse!;
  }

  //add mentor
  ApiResponse<FMentor>? _fAddMentorResponse;
  ApiResponse<FMentor>? get fAddMentorResponse => _fAddMentorResponse;
  set fAddMentorResponse(ApiResponse<FMentor>? value) {
    _fAddMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> addMentor(
      {required String email,
      required String fName,
      required String lName,
      required String joiningDate,
      required String phone,
      required int classId,
      required String city,
      required String town,
      required String street}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'email': email,
      'f_name': fName,
      'l_name': lName,
      'joining_date': joiningDate,
      'phone': phone,
      'class_id': classId,
      'city': city,
      'town': town,
      'street': street
    });
    if (await checkInternet()) {
      fAddMentorResponse = ApiResponse.loading('');
      try {
        FMentor mentor = await apiService.addMentor(formData);
        fAddMentorResponse = ApiResponse.completed(mentor);
      } catch (e) {
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

  //edit mentor
  ApiResponse<FMentor>? _fEditMentorResponse;
  ApiResponse<FMentor>? get fEditMentorResponse => _fEditMentorResponse;
  set fEditMentorResponse(ApiResponse<FMentor>? value) {
    _fEditMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> editMentor(
      {required String email,
      required String fName,
      required String lName,
      required String joiningDate,
      required int classId,
      required String phone,
      required String city,
      required String town,
      required String street,
      required int id}) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'email': email,
      'f_name': fName,
      'l_name': lName,
      'joining_date': joiningDate,
      'class_id': classId,
      'phone': phone,
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
      } catch (e) {
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

  //delete mentor
  ApiResponse<Delete>? _deleteMentorResponse;
  ApiResponse<Delete>? get deleteMentorResponse => _deleteMentorResponse;
  set deleteMentorResponse(ApiResponse<Delete>? value) {
    _deleteMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteMentor(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteMentorResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteMentor(id);
        deleteMentorResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteMentorResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return deleteMentorResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteMentorResponse = ApiResponse.error('No Internet Connection');
    }
    return deleteMentorResponse!;
  }

  ///=====================AUTH=====================///
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
      } catch (e) {
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

  ///=====================CLASSROOM=====================///

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
      } catch (e) {
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
    } else {
      fClassroomResponse = ApiResponse.error('No Internet Connection');
    }
    return fClassroomResponse!;
  }

  //add classroom
  ApiResponse<FClassroom>? _fAddClassroomResponse;
  ApiResponse<FClassroom>? get fAddClassroomResponse => _fAddClassroomResponse;
  set fAddClassroomResponse(ApiResponse<FClassroom>? value) {
    _fAddClassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> addClassroom(
      {required int classId, required String maxNumber}) async {
    ApiService apiService = ApiService(Dio());
    Map<String, dynamic> map = ({
      'max_number': maxNumber,
      'class_id': [classId],
    });
    FormData formData = FormData.fromMap({
      'classroom': [map],
    });
    if (await checkInternet()) {
      fAddClassroomResponse = ApiResponse.loading('');
      try {
        FClassroom classroom = await apiService.addClassroom(formData);
        fAddClassroomResponse = ApiResponse.completed(classroom);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddClassroomResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddClassroomResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddClassroomResponse =
          ApiResponse.error('No Internet Connection');
    }
    return fAddClassroomResponse!;
  }

  //edit classroom
  ApiResponse<FClassroom>? _fEditClassroomResponse;
  ApiResponse<FClassroom>? get fEditClassroomResponse =>
      _fEditClassroomResponse;
  set fEditClassroomResponse(ApiResponse<FClassroom>? value) {
    _fEditClassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> editClassroom(
      String name, String maxNumber, int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap(
        {'name': name, 'max_number': maxNumber, 'method': 'PUT'});
    if (await checkInternet()) {
      fEditClassroomResponse = ApiResponse.loading('');
      try {
        FClassroom classroom = await apiService.editClassroom(formData, id);
        fEditClassroomResponse = ApiResponse.completed(classroom);
      } catch (e) {
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

  //delete classroom
  ApiResponse<Delete>? _deleteClassroomResponse;
  ApiResponse<Delete>? get deleteClassroomResponse => _deleteClassroomResponse;
  set deleteClassroomResponse(ApiResponse<Delete>? value) {
    _deleteClassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteClassroom(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteClassroomResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteClassroom(id);
        deleteClassroomResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteClassroomResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return deleteClassroomResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteClassroomResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteClassroomResponse!;
  }

  ///=====================YEAR=====================///
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
      } catch (e) {
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
      } catch (e) {
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

  //delete academic year
  //delete classroom
  ApiResponse<Delete>? _deleteAcademicYearResponse;
  ApiResponse<Delete>? get deleteAcademicYearResponse =>
      _deleteAcademicYearResponse;
  set deleteAcademicYearResponse(ApiResponse<Delete>? value) {
    _deleteAcademicYearResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteAcademicYear(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteAcademicYearResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteAcademicYear(id);
        deleteAcademicYearResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteAcademicYearResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return deleteAcademicYearResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return deleteAcademicYearResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteAcademicYearResponse!;
  }

  //get seed
  ApiResponse<FSeed>? _getSeedResponse;
  ApiResponse<FSeed>? get getSeedResponse => _getSeedResponse;
  set getSeedResponse(ApiResponse<FSeed>? value) {
    _getSeedResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSeed>> getSeed() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getSeedResponse = ApiResponse.loading('');
      try {
        FSeed fSeed = await apiService.getSeed();
        getSeedResponse = ApiResponse.completed(fSeed);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            getSeedResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          getSeedResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return getSeedResponse = ApiResponse.error('No Internet Connection');
    }
    return getSeedResponse!;
  }

  //edit parent
  ApiResponse<FParent>? _editParentResponse;
  ApiResponse<FParent>? get editParentResponse => _editParentResponse;
  set editParentResponse(ApiResponse<FParent>? value) {
    _editParentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FParent>> editParent(
      int id,
      String fatherName,
      String motherName,
      String nationalNumber,
      String parentPhone,
      String parentEmail,
      String parentJop) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'father_name': fatherName,
      'mother_name': motherName,
      'national_number': nationalNumber,
      'parentPhone': parentPhone,
      'parentEmail': parentEmail,
      'parentJop': parentJop,
      '_method': 'PUT',
    });
    if (await checkInternet()) {
      editParentResponse = ApiResponse.loading('');
      try {
        FParent fParent = await apiService.editParent(formData, id);
        editParentResponse = ApiResponse.completed(fParent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            editParentResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          editParentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return editParentResponse = ApiResponse.error('No Internet Connection');
    }
    return editParentResponse!;
  }

  ///========================EXAMS==================///

  //get all exam
  // ApiResponse<FExam>? _fExams;
  // ApiResponse<FExam>? get fExamResponse => _fExams;
  // set fExamResponse(ApiResponse<FExam>? value) {
  //   _fExams = value;
  //   notifyListeners();
  // }
  //
  // Future<ApiResponse<FExam>> getAllExams() async {
  //   ApiService apiService = ApiService(Dio());
  //   if (await checkInternet()) {
  //     fExamResponse = ApiResponse.loading('');
  //     try {
  //       FExam fExam = await apiService.getAllExams();
  //       fExamResponse = ApiResponse.completed(fExam);
  //     } catch (e) {
  //       if (e is DioError) {
  //         try {
  //           throwCustomException(e);
  //         } catch (forcedException) {
  //           fExamResponse = ApiResponse.error(forcedException.toString());
  //         }
  //       } else {
  //         fExamResponse = ApiResponse.error(e.toString());
  //       }
  //     }
  //   }
  //   return fExamResponse!;
  // }

  //add exam
  ApiResponse<Delete>? _addExamResponse;
  ApiResponse<Delete>? get addExamResponse => _addExamResponse;
  set addExamResponse(ApiResponse<Delete>? value) {
    _addExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addExam() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addExam();
        addExamResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addExamResponse = ApiResponse.error('No Internet Connection');
    }
    return addExamResponse!;
  }

  //delete exam
  ApiResponse<Delete>? _deleteExamResponse;
  ApiResponse<Delete>? get deleteExamResponse => _deleteExamResponse;
  set deleteExamResponse(ApiResponse<Delete>? value) {
    _deleteExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteExam(id);
        deleteExamResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return deleteExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return deleteExamResponse = ApiResponse.error('No Internet Connection');
    }
    return deleteExamResponse!;
  }

  //set student exam mark
  ApiResponse<FMark>? _setStudentExamMarkResponse;
  ApiResponse<FMark>? get setStudentExamMarkResponse =>
      _setStudentExamMarkResponse;
  set setStudentExamMarkResponse(ApiResponse<FMark>? value) {
    _setStudentExamMarkResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMark>> setStudentExamMark(int id1, int id2) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      setStudentExamMarkResponse = ApiResponse.loading('');
      try {
        FMark fmark = await apiService.setStudentExamMark(id1, id2);
        setStudentExamMarkResponse = ApiResponse.completed(fmark);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return setStudentExamMarkResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return setStudentExamMarkResponse = ApiResponse.error(e.toString());
      }
    } else {
      return setStudentExamMarkResponse =
          ApiResponse.error('No Internet Connection');
    }
    return setStudentExamMarkResponse!;
  }

  //get student exam
  ApiResponse<FExam>? _getStudentExamResponse;
  ApiResponse<FExam>? get getStudentExamResponse => _getStudentExamResponse;
  set getStudentExamResponse(ApiResponse<FExam>? value) {
    _getStudentExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FExam>> getStudentExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentExamResponse = ApiResponse.loading('');
      try {
        FExam fexam = await apiService.getStudentExam(id);
        getStudentExamResponse = ApiResponse.completed(fexam);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentExamResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getStudentExamResponse!;
  }

  //get class exam
  ApiResponse<FExam>? _getClassExamResponse;
  ApiResponse<FExam>? get getClassExamResponse => _getClassExamResponse;
  set getClassExamResponse(ApiResponse<FExam>? value) {
    _getClassExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FExam>> getClassExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getClassExamResponse = ApiResponse.loading('');
      try {
        FExam fexam = await apiService.getClassExam(id);
        getClassExamResponse = ApiResponse.completed(fexam);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getClassExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getClassExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getClassExamResponse = ApiResponse.error('No Internet Connection');
    }
    return getClassExamResponse!;
  }

  ///==============================================///
  int getTeacherCount(ClassClassRooms classClassRooms) {
    int count = 0;
    for (int i = 0; i < classClassRooms.data!.length; i++) {
      count = count + classClassRooms.data![i].teacher!.length;
    }
    return count;
  }

  String getTeacherName(ClassClassRooms classClassRooms, int index) {
    int counter = 0;
    for (int i = 0; i < classClassRooms.data!.length; i++) {
      for (int j = 0; j < classClassRooms.data![i].teacher!.length; j++) {
        if (counter == index) {
          return classClassRooms.data![i].teacher![j].f_name!;
        }
        counter += 1;
      }
    }
    return '';
  }


  ApiResponse<ClassClassRooms>? _classClassroomsResponse;
  ApiResponse<ClassClassRooms>? get classClassroomsResponse =>
      _classClassroomsResponse;
  set classClassroomsResponse(ApiResponse<ClassClassRooms>? value) {
    _classClassroomsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<ClassClassRooms>> getClassClassrooms(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      classClassroomsResponse = ApiResponse.loading('');
      try {
        ClassClassRooms classClassrooms =
            await apiService.getClassClassrooms(id);
        classClassroomsResponse = ApiResponse.completed(classClassrooms);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return classClassroomsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return classClassroomsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return classClassroomsResponse =
          ApiResponse.error('No Internet Connection');
    }
    return classClassroomsResponse!;
  }
  // //get all syllabi
  // ApiResponse<FSyllabi>? _fSyllabi;
  // ApiResponse<FSyllabi>? get fSyllabiResponse => _fSyllabi;
  // set fSyllabiResponse(ApiResponse<FSyllabi>? value) {
  //   _fSyllabi = value;
  //   notifyListeners();
  // }
  //
  // Future<ApiResponse<FSyllabi>> getAllSyllabi() async {
  //   ApiService apiService = ApiService(Dio());
  //   if (await checkInternet()) {
  //     fSyllabiResponse = ApiResponse.loading('');
  //     try {
  //       FSyllabi fSyllabi = await apiService.getAllSyllabi();
  //       fSyllabiResponse = ApiResponse.completed(fSyllabi);
  //     } catch (e) {
  //       if (e is DioError) {
  //         try {
  //           throwCustomException(e);
  //         } catch (forcedException) {
  //           fSyllabiResponse = ApiResponse.error(forcedException.toString());
  //         }
  //       } else {
  //         fSyllabiResponse = ApiResponse.error(e.toString());
  //       }
  //     }
  //   }
  //   return fSyllabiResponse!;
  // }

  //add lessons to day
  ApiResponse<Delete>? _addLessonsToDayResponse;
  ApiResponse<Delete>? get addLessonsToDayResponse => _addLessonsToDayResponse;
  set addLessonsToDayResponse(ApiResponse<Delete>? value) {
    _addLessonsToDayResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addLessonsToDay(
    int id,
  ) async {
    FormData formData = FormData.fromMap({'_method': 'PUT'});
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addLessonsToDayResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addLessonsToDay(formData, id);
        addLessonsToDayResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addLessonsToDayResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addLessonsToDayResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addLessonsToDayResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addLessonsToDayResponse!;
  }

  //addSubjectsToTeacher
  ApiResponse<Delete>? _addSubjectsToTeacherResponse;
  ApiResponse<Delete>? get addSubjectsToTeacherResponse =>
      _addSubjectsToTeacherResponse;
  set addSubjectsToTeacherResponse(ApiResponse<Delete>? value) {
    _addSubjectsToTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addSubjectsToTeacher(
    int id,
    int classId,
    int classroomId,
    int subjectId,
  ) async {
    FormData formData = FormData.fromMap({
      '_method': 'PUT',
      'subject_id': subjectId,
      'classroom_id': classroomId,
      'class_id': classId,
    });
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addSubjectsToTeacherResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addSubjectsToTeacher(formData, id);
        addSubjectsToTeacherResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addSubjectsToTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addSubjectsToTeacherResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addSubjectsToTeacherResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addSubjectsToTeacherResponse!;
  }

  //add classroom to class
  ApiResponse<Delete>? _addClassroomToClassResponse;
  ApiResponse<Delete>? get addClassroomToClassResponse =>
      _addClassroomToClassResponse;
  set addClassroomToClassResponse(ApiResponse<Delete>? value) {
    _addClassroomToClassResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addClassroomToClass(
    int id,
  ) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      FormData formData = FormData.fromMap({'_method': 'PUT'});
      addClassroomToClassResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addClassroomToClass(formData, id);
        addClassroomToClassResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addClassroomToClassResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addClassroomToClassResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addClassroomToClassResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addClassroomToClassResponse!;
  }

  //add subject to class
  ApiResponse<Delete>? _addSubjectsToClassResponse;
  ApiResponse<Delete>? get addSubjectsToClassResponse =>
      _addSubjectsToClassResponse;
  set addSubjectsToClassResponse(ApiResponse<Delete>? value) {
    _addSubjectsToClassResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addSubjectsToClass(
    int id,
  ) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addSubjectsToClassResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addSubjectsToClass(id);
        addSubjectsToClassResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addSubjectsToClassResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addSubjectsToClassResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addSubjectsToClassResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addSubjectsToClassResponse!;
  }

  //get subjects classes classrooms
  ApiResponse<FAllSubjectsModel>? _getSubjectClassClassroomResponse;
  ApiResponse<FAllSubjectsModel>? get getSubjectClassClassroomResponse =>
      _getSubjectClassClassroomResponse;
  set getSubjectClassClassroomResponse(ApiResponse<FAllSubjectsModel>? value) {
    _getSubjectClassClassroomResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FAllSubjectsModel>> getSubjectClassClassroom() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getSubjectClassClassroomResponse = ApiResponse.loading('');
      try {
        FAllSubjectsModel allsubjectsmodel =
            await apiService.getSubjectClassClassroom();
        getSubjectClassClassroomResponse =
            ApiResponse.completed(allsubjectsmodel);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getSubjectClassClassroomResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getSubjectClassClassroomResponse =
            ApiResponse.error(e.toString());
      }
    } else {
      return getSubjectClassClassroomResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getSubjectClassClassroomResponse!;
  }

  //get all exams
  ApiResponse<FAllExams>? _getAllExamsResponse;
  ApiResponse<FAllExams>? get getAllExamsResponse => _getAllExamsResponse;
  set getAllExamsResponse(ApiResponse<FAllExams>? value) {
    _getAllExamsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FAllExams>> getAllExams() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getAllExamsResponse = ApiResponse.loading('');
      try {
        FAllExams fallexams = await apiService.getAllExams();
        getAllExamsResponse = ApiResponse.completed(fallexams);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getAllExamsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getAllExamsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getAllExamsResponse = ApiResponse.error('No Internet Connection');
    }
    return getAllExamsResponse!;
  }

  //accept exam
  ApiResponse<Delete>? _acceptExamResponse;
  ApiResponse<Delete>? get acceptExamResponse => _acceptExamResponse;
  set acceptExamResponse(ApiResponse<Delete>? value) {
    _acceptExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> acceptExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      acceptExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.acceptExam(id);
        acceptExamResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return acceptExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return acceptExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return acceptExamResponse = ApiResponse.error('No Internet Connection');
    }
    return acceptExamResponse!;
  }

//edit exam date
  ApiResponse<Delete>? _editExamDateResponse;
  ApiResponse<Delete>? get editExamDateResponse => _editExamDateResponse;
  set editExamDateResponse(ApiResponse<Delete>? value) {
    _editExamDateResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> editExamDate(
      int id, DateTime start, DateTime end) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'start': start,
      'end': end,
    });
    if (await checkInternet()) {
      editExamDateResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.editExamDate(id, formData);
        editExamDateResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return editExamDateResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return editExamDateResponse = ApiResponse.error(e.toString());
      }
    } else {
      return editExamDateResponse = ApiResponse.error('No Internet Connection');
    }
    return editExamDateResponse!;
  }

//all syllabi
  ApiResponse<FSyllabi>? _getSyllabiResponse;
  ApiResponse<FSyllabi>? get getSyllabiResponse => _getSyllabiResponse;
  set getSyllabiResponse(ApiResponse<FSyllabi>? value) {
    _getSyllabiResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSyllabi>> getSyllabi() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getSyllabiResponse = ApiResponse.loading('');
      try {
        FSyllabi fsyllabi = await apiService.getSyllabi();
        getSyllabiResponse = ApiResponse.completed(fsyllabi);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getSyllabiResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getSyllabiResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getSyllabiResponse = ApiResponse.error('No Internet Connection');
    }
    return getSyllabiResponse!;
  }

//accept syllabi
  ApiResponse<Delete>? _acceptSyllabiResponse;
  ApiResponse<Delete>? get acceptSyllabiResponse => _acceptSyllabiResponse;
  set acceptSyllabiResponse(ApiResponse<Delete>? value) {
    _acceptSyllabiResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> acceptSyllabi(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      acceptSyllabiResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.acceptSyllabi(id);
        acceptSyllabiResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return acceptSyllabiResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return acceptSyllabiResponse = ApiResponse.error(e.toString());
      }
    } else {
      return acceptSyllabiResponse =
          ApiResponse.error('No Internet Connection');
    }
    return acceptSyllabiResponse!;
  }

//delete syllabi
  ApiResponse<Delete>? _deleteSyllabiResponse;
  ApiResponse<Delete>? get deleteSyllabiResponse => _deleteSyllabiResponse;
  set deleteSyllabiResponse(ApiResponse<Delete>? value) {
    _deleteSyllabiResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteSyllabi(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteSyllabiResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteSyllabi(id);
        deleteSyllabiResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteSyllabiResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return deleteSyllabiResponse = ApiResponse.error(e.toString());
      }
    } else {
      return deleteSyllabiResponse =
          ApiResponse.error('No Internet Connection');
    }
    return deleteSyllabiResponse!;
  }

  ApiResponse<Settings>? _getSettingsResponse;
  ApiResponse<Settings>? get getSettingsResponse => _getSettingsResponse;
  set getSettingsResponse(ApiResponse<Settings>? value) {
    _getSettingsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Settings>> getSettings() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getSettingsResponse = ApiResponse.loading('');
      try {
        Settings settings = await apiService.getSettings();
        getSettingsResponse = ApiResponse.completed(settings);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getSettingsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getSettingsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getSettingsResponse = ApiResponse.error('No Internet Connection');
    }
    return getSettingsResponse!;
  }

  ApiResponse<Settings>? _editSettingsResponse;
  ApiResponse<Settings>? get editSettingsResponse => _editSettingsResponse;
  set editSettingsResponse(ApiResponse<Settings>? value) {
    _editSettingsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Settings>> editSettings(String phone, String name,
      String color, String city, String town, String street, String email,
      {String? picture, String? oldP, String? newP}) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      editSettingsResponse = ApiResponse.loading('');
      try {
        Settings settings = await apiService.editSettings(
            phone, name, color, city, town, street, email, 'PUT',
            picture: picture, oldP: oldP, newP: newP);
        editSettingsResponse = ApiResponse.completed(settings);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return editSettingsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return editSettingsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return editSettingsResponse = ApiResponse.error('No Internet Connection');
    }
    return editSettingsResponse!;
  }

  ApiResponse<Delete>? _timeTableResponse;
  ApiResponse<Delete>? get timeTableResponse => _timeTableResponse;
  set timeTableResponse(ApiResponse<Delete>? value) {
    _timeTableResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addTimeTable(Map<String,dynamic> map) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      timeTableResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addTimeTable(map);
        timeTableResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return timeTableResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return timeTableResponse = ApiResponse.error(e.toString());
      }
    } else {
      return timeTableResponse = ApiResponse.error('No Internet Connection');
    }
    return timeTableResponse!;
  }
}

dynamic throwCustomException(DioError? dioError) {
  var statusCode = dioError?.response?.statusCode;
  switch (dioError!.type) {
    case DioErrorType.cancel:
      throw RequestWasCancelledException("CANCEL");
    case DioErrorType.connectTimeout:
      throw ConnectionTimeout("CONNECT_TIMEOUT");
    case DioErrorType.other:
      throw DefaultTimeout("DEFAULT");
    case DioErrorType.receiveTimeout:
      throw ReceiveTimeout("RECEIVE_TIMEOUT");
    case DioErrorType.sendTimeout:
      throw SendTimeout("SEND_TIMEOUT");
    case DioErrorType.response:
      switch (statusCode) {
        case 400:
          throw BadRequestException(dioError.response?.statusMessage);
        case 401:
        case 403:
          throw UnauthorisedException(dioError.response?.statusMessage);
        case 404:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
        case 500:
        default:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
      }
  }
}
