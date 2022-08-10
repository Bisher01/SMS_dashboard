
import 'package:json_annotation/json_annotation.dart';
import 'package:sms_dashboard/models/models.dart';
part 'settings.g.dart';

@JsonSerializable()
class Settings {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;
  @JsonKey(defaultValue: '')
  String? logo;
  @JsonKey(defaultValue: '')
  String? color;
  @JsonKey(defaultValue: '')
  String? phone;
  @JsonKey(name: 'admin_id',defaultValue: 0)
  int? adminId;
  @JsonKey(name: 'address_id',defaultValue: 0)
  int? addressId;
  Address? address;
  Admin? admin;

  Settings({
    this.address,
    this.name,
    this.id,
    this.phone,
    this.color,
    this.admin,
    this.addressId,
    this.adminId,
    this.logo,
  });
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
