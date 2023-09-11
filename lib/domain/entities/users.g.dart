// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      (json['content'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['empty'] as bool?,
      json['first'] as bool?,
      json['last'] as bool?,
      json['number'] as int?,
      json['numberOfElements'] as int?,
      json['size'] as int?,
      json['totalElements'] as int?,
      json['totalPages'] as int?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'content': instance.content,
      'empty': instance.empty,
      'first': instance.first,
      'last': instance.last,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
