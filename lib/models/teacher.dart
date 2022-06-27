import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? joining_date;
  String? salary;
  int? subject_id;
  int? address_id;
  int? blood_id;
  int? gender_id;
  int? grade_id;
  String? created_at;
  String? updated_at;

  Teacher({
      this.address_id,
      this.blood_id,
      this.code,
      this.created_at,
      this.email,
      this.f_name,
      this.gender_id,
      this.grade_id,
      this.id,
      this.l_name,
      this.updated_at,
      this.joining_date,
      this.salary,
      this.subject_id});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
@JsonSerializable()
class FTeacher{
  bool? status;
  String? message;
  @JsonKey(name: 'Teacher Data')
  List<Teacher>? teacherData;

  FTeacher({
    this.status,
    this.message,
    this.teacherData
});
  factory FTeacher.fromJson(Map<String, dynamic> json) =>
      _$FTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$FTeacherToJson(this);
}
