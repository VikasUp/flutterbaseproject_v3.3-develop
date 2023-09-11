// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OTPVerifyRequest _$$_OTPVerifyRequestFromJson(Map<String, dynamic> json) =>
    _$_OTPVerifyRequest(
      channel: json['channel'] as String?,
      countryDialCode: json['countryDialCode'] as String?,
      to: json['to'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$_OTPVerifyRequestToJson(_$_OTPVerifyRequest instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'countryDialCode': instance.countryDialCode,
      'to': instance.to,
      'otp': instance.otp,
    };
