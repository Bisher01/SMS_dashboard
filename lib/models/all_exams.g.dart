// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_exams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAllExams _$FAllExamsFromJson(Map<String, dynamic> json) => FAllExams(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllExams.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$FAllExamsToJson(FAllExams instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AllExams _$AllExamsFromJson(Map<String, dynamic> json) => AllExams(
      mark: json['mark'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      season_id: json['season_id'] as int?,
      exam_name_id: json['exam_name_id'] as int?,
      subject_mark_id: json['subject_mark_id'] as int?,
      id: json['id'] as int?,
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      subject_mark: json['subject_mark'] == null
          ? null
          : SubjectMark.fromJson(json['subject_mark'] as Map<String, dynamic>),
      active: json['active'] as int?,
    );

Map<String, dynamic> _$AllExamsToJson(AllExams instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'active': instance.active,
      'exam_name_id': instance.exam_name_id,
      'subject_mark_id': instance.subject_mark_id,
      'season_id': instance.season_id,
      'subject_mark': instance.subject_mark,
    };

SubjectMark _$SubjectMarkFromJson(Map<String, dynamic> json) => SubjectMark(
      id: json['id'] as int?,
      mark: json['mark'] as int?,
      class_id: json['class_id'] as int?,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      subject_id: json['subject_id'] as int?,
    );

Map<String, dynamic> _$SubjectMarkToJson(SubjectMark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mark': instance.mark,
      'subject_id': instance.subject_id,
      'class_id': instance.class_id,
      'subject': instance.subject,
    };
