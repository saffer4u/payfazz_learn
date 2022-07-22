// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      userDistrict: json['userDistrict'] as String,
      landmark: json['landmark'] as String,
      pin: json['pin'] as int,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'landmark': instance.landmark,
      'userDistrict': instance.userDistrict,
      'pin': instance.pin,
    };
