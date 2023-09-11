// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_sent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpSentModel _$$_OtpSentModelFromJson(Map<String, dynamic> json) =>
    _$_OtpSentModel(
      message: json['message'] as String?,
      httpStatus: json['httpStatus'] as int?,
      applicationStatusCode: json['applicationStatusCode'] as int?,
      id: json['id'] as int?,
      userActive: json['userActive'] as bool?,
    );

Map<String, dynamic> _$$_OtpSentModelToJson(_$_OtpSentModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'httpStatus': instance.httpStatus,
      'applicationStatusCode': instance.applicationStatusCode,
      'id': instance.id,
      'userActive': instance.userActive,
    };
