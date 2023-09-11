// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditProfileRequest _$$_EditProfileRequestFromJson(
        Map<String, dynamic> json) =>
    _$_EditProfileRequest(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as int?,
      authToken: json['authToken'] as String?,
      countryDialCode: json['countryDialCode'] == null
          ? null
          : CountryDialCode.fromJson(
              json['countryDialCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EditProfileRequestToJson(
        _$_EditProfileRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'authToken': instance.authToken,
      'countryDialCode': instance.countryDialCode,
    };
