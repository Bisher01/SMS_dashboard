import 'package:json_annotation/json_annotation.dart';
import 'package:sms_dashboard/models/models.dart';

part 'subjects.g.dart';

@JsonSerializable()
class AllSubjectsModel {
  int? id;
  String? name;
  List<Classes>? classes;

  AllSubjectsModel({this.id, this.name, this.classes});

  factory AllSubjectsModel.fromJson(Map<String, dynamic> json) =>
      _$AllSubjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllSubjectsModelToJson(this);
}

@JsonSerializable()
class FAllSubjectsModel {
  bool? status;
  String? message;
  List<AllSubjectsModel>? data;
  FAllSubjectsModel({
    this.data,
    this.status,
    this.message,
  });
  factory FAllSubjectsModel.fromJson(Map<String, dynamic> json) =>
      _$FAllSubjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FAllSubjectsModelToJson(this);
}
