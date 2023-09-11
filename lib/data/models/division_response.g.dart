// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DivisionResponse _$$_DivisionResponseFromJson(Map<String, dynamic> json) =>
    _$_DivisionResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => TeamResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DivisionResponseToJson(_$_DivisionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teams': instance.teams,
    };
