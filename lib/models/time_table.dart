import 'package:json_annotation/json_annotation.dart';
import 'package:sms_dashboard/models/models.dart';

part 'time_table.g.dart';

@JsonSerializable()
class ClassClassRooms {
  bool? status;
  String? message;
  List<SClassRooms>? data;
  ClassClassRooms({this.message,this.status,this.data});
factory ClassClassRooms.fromJson(Map<String,dynamic> json) => _$ClassClassRoomsFromJson(json);
Map<String,dynamic> toJson() => _$ClassClassRoomsToJson(this);
}

@JsonSerializable()
class STeacher {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? joining_date;
  String? salary;
  String? picture;
  int? address_id;
  int? religion_id;
  int? gender_id;

  STeacher(
      {this.email,
      this.id,
      this.picture,
      this.l_name,
      this.f_name,
      this.address_id,
      this.code,
      this.gender_id,
      this.joining_date,
      this.religion_id,
      this.salary});

  factory STeacher.fromJson(Map<String,dynamic> json) => _$STeacherFromJson(json);
  Map<String,dynamic> toJson() => _$STeacherToJson(this);
}

@JsonSerializable()
class SClassRooms{
  int? id;
  int? class_id;
  int? classroom_id;
  Classroom? classrooms;
  List<STeacher>? teacher;

  SClassRooms({this.id,this.teacher,this.classrooms,this.class_id,this.classroom_id});
  factory SClassRooms.fromJson(Map<String,dynamic> json) => _$SClassRoomsFromJson(json);
  Map<String,dynamic> toJson() => _$SClassRoomsToJson(this);

}

@JsonSerializable()
class SendTimeTable{
  int? id;
  List<DayId>? day_id;
  SendTimeTable({this.id,this.day_id});
  factory SendTimeTable.fromJson(Map<String,dynamic>json) => _$SendTimeTableFromJson(json);
  Map<String,dynamic> toJson() => _$SendTimeTableToJson(this);
}


@JsonSerializable()
class LessonId{
  int? id;
  int? teacher_id;
  LessonId({this.id,this.teacher_id});
  factory LessonId.fromJson(Map<String,dynamic> json) => _$LessonIdFromJson(json);
  Map<String,dynamic> toJson() => _$LessonIdToJson(this);
}

@JsonSerializable()
class ClassroomId{
int? id;
List<LessonId>? lesson_id;
ClassroomId({this.id,this.lesson_id});
factory ClassroomId.fromJson(Map<String,dynamic> json) => _$ClassroomIdFromJson(json);
Map<String,dynamic> toJson() => _$ClassroomIdToJson(this);
}


@JsonSerializable()
class DayId{
int? id;
List<ClassroomId>? classroom_id;
DayId({this.id,this.classroom_id});
factory DayId.fromJson(Map<String,dynamic> json) => _$DayIdFromJson(json);
Map<String,dynamic> toJson() => _$DayIdToJson(this);
}