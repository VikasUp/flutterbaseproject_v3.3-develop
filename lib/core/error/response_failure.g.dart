// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseFailure _$$_ResponseFailureFromJson(Map<String, dynamic> json) =>
    _$_ResponseFailure(
      message: json['message'] as String?,
      applicationStatusCode: json['applicationStatusCode'] as int?,
      httpStatus: json['httpStatus'] as int?,
    );

Map<String, dynamic> _$$_ResponseFailureToJson(_$_ResponseFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'applicationStatusCode': instance.applicationStatusCode,
      'httpStatus': instance.httpStatus,
    };
