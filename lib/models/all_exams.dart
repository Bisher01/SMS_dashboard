/*
*/
import 'package:json_annotation/json_annotation.dart';
import 'package:sms_dashboard/models/models.dart';
part 'all_exams.g.dart';


@JsonSerializable()
class FAllExams{
  bool? status;
  String? message;
  List<AllExams>? exams;
  FAllExams({this.message,this.exams,this.status,});
  factory FAllExams.fromJson(Map<String, dynamic> json) => _$FAllExamsFromJson(json);
  Map<String, dynamic> toJson() => _$FAllExamsToJson(this);
}
@JsonSerializable()
class AllExams {
  @JsonKey(defaultValue: 0)
  int? id;
  DateTime? start;
  DateTime? end;
  @JsonKey(defaultValue: 0)
  int? mark;
  @JsonKey(defaultValue: 0)
  int? active;
  @JsonKey(defaultValue: 0)
  int? exam_name_id;
  @JsonKey(defaultValue: 0)
  int? subject_mark_id;
  @JsonKey(defaultValue: 0)
  int? season_id;
  SubjectMark? subject_mark;
  AllExams(
      {this.mark,
      this.start,
      this.season_id,
      this.exam_name_id,
      this.subject_mark_id,
      this.id,
      this.end,
      this.subject_mark,
      this.active});
  factory AllExams.fromJson(Map<String, dynamic> json) => _$AllExamsFromJson(json);
  Map<String, dynamic> toJson() => _$AllExamsToJson(this);
}

@JsonSerializable()
class SubjectMark {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? mark;
  @JsonKey(defaultValue: 0)
  int? subject_id;
  @JsonKey(defaultValue: 0)
  int? class_id;
  Subject? subject;
  SubjectMark({
    this.id,
    this.mark,
    this.class_id,
    this.subject,
    this.subject_id,
  });

  factory SubjectMark.fromJson(Map<String, dynamic> json) => _$SubjectMarkFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectMarkToJson(this);
}
