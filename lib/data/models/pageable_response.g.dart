// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageableResponse _$$_PageableResponseFromJson(Map<String, dynamic> json) =>
    _$_PageableResponse(
      offset: json['offset'] as int?,
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      paged: json['paged'] as bool?,
      sort: json['sort'] == null
          ? null
          : SortResponse.fromJson(json['sort'] as Map<String, dynamic>),
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$$_PageableResponseToJson(_$_PageableResponse instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'sort': instance.sort,
      'unpaged': instance.unpaged,
    };
