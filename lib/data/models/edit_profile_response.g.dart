// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditProfileResponse _$$_EditProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_EditProfileResponse(
      message: json['message'] as String?,
      httpStatus: json['httpStatus'] as int?,
      idToken: json['idToken'] as String?,
    );

Map<String, dynamic> _$$_EditProfileResponseToJson(
        _$_EditProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'httpStatus': instance.httpStatus,
      'idToken': instance.idToken,
    };
