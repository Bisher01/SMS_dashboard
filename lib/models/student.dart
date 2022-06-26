import 'package:json_annotation/json_annotation.dart';


part 'student.g.dart';

@JsonSerializable()
class Student {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? nationality;
  String? picture;
  String? birthdate;
  int? parent_id;
  int? blood_id;
  int? gender_id;
  int? religion_id;
  int? grade_id;
  int? class_id;
  int? classroom_id;
  int? academic_year_id;
  int? address_id;
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
      this.nationality,
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
  String? status;
  String? message;
  @JsonKey(name: 'Student Data')
  List<Student>? studentData;
  FStudent({this.status, this.message, this.studentData});
  factory FStudent.fromJson(Map<String, dynamic> json) =>
      _$FStudentFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentToJson(this);
}
