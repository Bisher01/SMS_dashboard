import 'package:json_annotation/json_annotation.dart';

part 'academic_years.g.dart';

@JsonSerializable()
class AcademicYears{
  int id;
  String date;
  String created_at;
  String updated_at;

  AcademicYears({

    required this.updated_at,
    required this.id,
    required this.created_at,
    required this.date
});

  factory AcademicYears.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearsFromJson(json);
  Map<String, dynamic> toJson() => _$AcademicYearsToJson(this);

}

@JsonSerializable()
class FAcademicYears{
  String? status;
  String? message;
  @JsonKey(name: 'Academic Years')
  List<AcademicYears>? academicYears;
  FAcademicYears({
    this.message,
    this.status,
    this.academicYears
});

  factory FAcademicYears.fromJson(Map<String, dynamic> json) =>
      _$FAcademicYearsFromJson(json);
  Map<String, dynamic> toJson() => _$FAcademicYearsToJson(this);

}