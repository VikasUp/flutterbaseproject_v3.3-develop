// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRegisterRequest _$$_UserRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UserRegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      status: json['status'] as bool,
      phoneNumber: json['phoneNumber'] as int?,
    );

Map<String, dynamic> _$$_UserRegisterRequestToJson(
        _$_UserRegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'status': instance.status,
      'phoneNumber': instance.phoneNumber,
    };
