import 'package:json_annotation/json_annotation.dart';
part 'student_exam.g.dart';

@JsonSerializable()
class StudentExam {

  bool? status;
  String? message;
  List<ExamData>? exams;

  StudentExam({
    this.status,
    this.message,
    this.exams,
  });

  factory StudentExam.fromJson(Map<String, dynamic> json) =>
      _$StudentExamFromJson(json);
  Map<String, dynamic> toJson() => _$StudentExamToJson(this);

}

@JsonSerializable()
class ExamData {
  @JsonKey(defaultValue: 0)
  int? id;
  DateTime? start;
  DateTime? end;
  @JsonKey(defaultValue: 0)
  int? mark;
  @JsonKey(defaultValue: 0)
  int? examNameId;
  @JsonKey(defaultValue: 0)
  int? subjectMarkId;
  @JsonKey(defaultValue: 0)
  int? seasonId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Questions>? questions;

  ExamData({
    this.id,
    this.start,
    this.end,
    this.mark,
    this.examNameId,
    this.subjectMarkId,
    this.seasonId,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}

@JsonSerializable()
class Questions {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? text;
  @JsonKey(defaultValue: 0)
  int? teacherSubjectsId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Choices>? choices;

  Questions({
    this.id,
    this.text,
    this.teacherSubjectsId,
    this.createdAt,
    this.updatedAt,
    this.choices,
  });

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable()
class Choices {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? text;
  @JsonKey(defaultValue: 0)
  int? status;
  @JsonKey(defaultValue: 0)
  int? questionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Choices({
    this.id,
    this.text,
    this.status,
    this.questionId,
    this.createdAt,
    this.updatedAt,
  });

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}
