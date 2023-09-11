// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedListResponse<T> _$$_PaginatedListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_PaginatedListResponse<T>(
      content: (json['content'] as List<dynamic>?)?.map(fromJsonT).toList(),
      empty: json['empty'] as bool?,
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      number: json['number'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
      pageable: json['pageable'] == null
          ? null
          : PageableResponse.fromJson(json['pageable'] as Map<String, dynamic>),
      size: json['size'] as int?,
      sort: json['sort'] == null
          ? null
          : SortResponse.fromJson(json['sort'] as Map<String, dynamic>),
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$$_PaginatedListResponseToJson<T>(
  _$_PaginatedListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'content': instance.content?.map(toJsonT).toList(),
      'empty': instance.empty,
      'first': instance.first,
      'last': instance.last,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'pageable': instance.pageable,
      'size': instance.size,
      'sort': instance.sort,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
