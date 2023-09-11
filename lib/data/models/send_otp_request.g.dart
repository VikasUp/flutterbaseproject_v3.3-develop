// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendOTPRequest _$$_SendOTPRequestFromJson(Map<String, dynamic> json) =>
    _$_SendOTPRequest(
      channel: json['channel'] as String,
      to: json['to'] as String,
      countryDialCode: json['countryDialCode'] as String?,
    );

Map<String, dynamic> _$$_SendOTPRequestToJson(_$_SendOTPRequest instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'to': instance.to,
      'countryDialCode': instance.countryDialCode,
    };
