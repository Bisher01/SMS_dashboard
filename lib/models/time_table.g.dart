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
      address_id: json['address_id'] as String?,
      code: json['code'] as String?,
      gender_id: json['gender_id'] as String?,
      joining_date: json['joining_date'] == null
          ? null
          : DateTime.parse(json['joining_date'] as String),
      religion_id: json['religion_id'] as String?,
      salary: json['salary'] as String?,
    );

Map<String, dynamic> _$STeacherToJson(STeacher instance) => <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'joining_date': instance.joining_date?.toIso8601String(),
      'salary': instance.salary,
      'picture': instance.picture,
      'address_id': instance.address_id,
      'religion_id': instance.religion_id,
      'gender_id': instance.gender_id,
    };

SClassroom _$SClassroomFromJson(Map<String, dynamic> json) => SClassroom(
      id: json['id'] as int?,
      name: json['name'] as int?,
      max_number: json['max_number'] as int?,
    );

Map<String, dynamic> _$SClassroomToJson(SClassroom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'max_number': instance.max_number,
      'name': instance.name,
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
