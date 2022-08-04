// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSubjectsModel _$AllSubjectsModelFromJson(Map<String, dynamic> json) =>
    AllSubjectsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Classes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllSubjectsModelToJson(AllSubjectsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classes': instance.classes,
    };

FAllSubjectsModel _$FAllSubjectsModelFromJson(Map<String, dynamic> json) =>
    FAllSubjectsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllSubjectsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FAllSubjectsModelToJson(FAllSubjectsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
