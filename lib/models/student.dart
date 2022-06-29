import 'package:json_annotation/json_annotation.dart';


part 'student.g.dart';

@JsonSerializable()
class Student {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? nationality_id;
  String? picture;
  String? birthdate;
  String? parent_id;
  String? blood_id;
  String? gender_id;
  String? religion_id;
  String? grade_id;
  String? class_id;
  String? classroom_id;
  String? academic_year_id;
  String? address_id;
  String? deleted_at;
  String? created_at;
  String? updated_at;

  Student(
      {this.academic_year_id,
      this.address_id,
      this.birthdate,
      this.blood_id,
      this.class_id,
      this.classroom_id,
      this.code,
      this.created_at,
      this.deleted_at,
      this.email,
      this.f_name,
      this.gender_id,
      this.grade_id,
      this.id,
      this.l_name,
      this.nationality_id,
      this.parent_id,
      this.picture,
      this.religion_id,
      this.updated_at});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class FStudent {
  bool? status;
  String? message;
  List<Student>? student;
  FStudent({this.status, this.message, this.student});
  factory FStudent.fromJson(Map<String, dynamic> json) =>
      _$FStudentFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentToJson(this);
}
