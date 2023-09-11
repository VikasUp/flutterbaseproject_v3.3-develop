// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRequest _$$_LoginRequestFromJson(Map<String, dynamic> json) =>
    _$_LoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      rememberMe: json['rememberMe'] as bool,
    );

Map<String, dynamic> _$$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'rememberMe': instance.rememberMe,
    };
