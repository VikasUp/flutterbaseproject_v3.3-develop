// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verified.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPVerified _$OTPVerifiedFromJson(Map<String, dynamic> json) => OTPVerified(
      message: json['message'] as String?,
      idToken: json['idToken'] as String?,
      httpStatus: json['httpStatus'] as int?,
      id: json['id'] as int?,
      applicationStatusCode: json['applicationStatusCode'] as int?,
      profileComplete: json['profileComplete'] as bool?,
    );

Map<String, dynamic> _$OTPVerifiedToJson(OTPVerified instance) =>
    <String, dynamic>{
      'message': instance.message,
      'idToken': instance.idToken,
      'httpStatus': instance.httpStatus,
      'id': instance.id,
      'applicationStatusCode': instance.applicationStatusCode,
      'profileComplete': instance.profileComplete,
    };
