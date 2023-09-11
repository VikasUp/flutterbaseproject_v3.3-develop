// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as int?,
      imageUrl: json['imageUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      activationKey: json['activationKey'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'imageUrl': instance.imageUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'activationKey': instance.activationKey,
      'status': instance.status,
    };
