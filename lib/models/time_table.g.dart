// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassClassRooms _$ClassClassRoomsFromJson(Map<String, dynamic> json) =>
    ClassClassRooms(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SClassRooms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassClassRoomsToJson(ClassClassRooms instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

STeacher _$STeacherFromJson(Map<String, dynamic> json) => STeacher(
      email: json['email'] as String?,
      id: json['id'] as int?,
      picture: json['picture'] as String?,
      l_name: json['l_name'] as String?,
      f_name: json['f_name'] as String?,
      address_id: json['address_id'] as int?,
      code: json['code'] as String?,
      gender_id: json['gender_id'] as int?,
      joining_date: json['joining_date'] as String?,
      religion_id: json['religion_id'] as int?,
      salary: json['salary'] as String?,
    );

Map<String, dynamic> _$STeacherToJson(STeacher instance) => <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'joining_date': instance.joining_date,
      'salary': instance.salary,
      'picture': instance.picture,
      'address_id': instance.address_id,
      'religion_id': instance.religion_id,
      'gender_id': instance.gender_id,
    };

SClassRooms _$SClassRoomsFromJson(Map<String, dynamic> json) => SClassRooms(
      id: json['id'] as int?,
      teacher: (json['teacher'] as List<dynamic>?)
          ?.map((e) => STeacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      classrooms: json['classrooms'] == null
          ? null
          : Classroom.fromJson(json['classrooms'] as Map<String, dynamic>),
      class_id: json['class_id'] as int?,
      classroom_id: json['classroom_id'] as int?,
    );

Map<String, dynamic> _$SClassRoomsToJson(SClassRooms instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class_id': instance.class_id,
      'classroom_id': instance.classroom_id,
      'classrooms': instance.classrooms,
      'teacher': instance.teacher,
    };

SendTimeTable _$SendTimeTableFromJson(Map<String, dynamic> json) =>
    SendTimeTable(
      id: json['id'] as int?,
      day_id: (json['day_id'] as List<dynamic>?)
          ?.map((e) => DayId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SendTimeTableToJson(SendTimeTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day_id': instance.day_id,
    };

LessonId _$LessonIdFromJson(Map<String, dynamic> json) => LessonId(
      id: json['id'] as int?,
      teacher_id: json['teacher_id'] as int?,
    );

Map<String, dynamic> _$LessonIdToJson(LessonId instance) => <String, dynamic>{
      'id': instance.id,
      'teacher_id': instance.teacher_id,
    };

ClassroomId _$ClassroomIdFromJson(Map<String, dynamic> json) => ClassroomId(
      id: json['id'] as int?,
      lesson_id: (json['lesson_id'] as List<dynamic>?)
          ?.map((e) => LessonId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassroomIdToJson(ClassroomId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson_id': instance.lesson_id,
    };

DayId _$DayIdFromJson(Map<String, dynamic> json) => DayId(
      id: json['id'] as int?,
      classroom_id: (json['classroom_id'] as List<dynamic>?)
          ?.map((e) => ClassroomId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayIdToJson(DayId instance) => <String, dynamic>{
      'id': instance.id,
      'classroom_id': instance.classroom_id,
    };
