// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OTPVerifyResponse _$$_OTPVerifyResponseFromJson(Map<String, dynamic> json) =>
    _$_OTPVerifyResponse(
      message: json['message'] as String?,
      idToken: json['idToken'] as String?,
      httpStatus: json['httpStatus'] as int?,
      id: json['id'] as int?,
      applicationStatusCode: json['applicationStatusCode'] as int?,
      profileComplete: json['profileComplete'] as bool?,
    );

Map<String, dynamic> _$$_OTPVerifyResponseToJson(
        _$_OTPVerifyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'idToken': instance.idToken,
      'httpStatus': instance.httpStatus,
      'id': instance.id,
      'applicationStatusCode': instance.applicationStatusCode,
      'profileComplete': instance.profileComplete,
    };
