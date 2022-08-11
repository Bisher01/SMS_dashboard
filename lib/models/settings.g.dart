// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phone: json['phone'] as String? ?? '',
      color: json['color'] as String? ?? '',
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      addressId: json['address_id'] as int? ?? 0,
      adminId: json['admin_id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'color': instance.color,
      'phone': instance.phone,
      'admin_id': instance.adminId,
      'address_id': instance.addressId,
      'address': instance.address,
      'admin': instance.admin,
    };
