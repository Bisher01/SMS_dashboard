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
  int? id;
  DateTime? start;
  DateTime? end;
  int? mark;
  int? active;
  int? exam_name_id;
  int? subject_mark_id;
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
  int? id;
  int? mark;
  int? subject_id;
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
