// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_sent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPSent _$OTPSentFromJson(Map<String, dynamic> json) => OTPSent(
      message: json['message'] as String?,
      httpStatus: json['httpStatus'] as int?,
      applicationStatusCode: json['applicationStatusCode'] as int?,
      id: json['id'] as int?,
      userActive: json['userActive'] as bool?,
    );

Map<String, dynamic> _$OTPSentToJson(OTPSent instance) => <String, dynamic>{
      'message': instance.message,
      'httpStatus': instance.httpStatus,
      'applicationStatusCode': instance.applicationStatusCode,
      'id': instance.id,
      'userActive': instance.userActive,
    };
