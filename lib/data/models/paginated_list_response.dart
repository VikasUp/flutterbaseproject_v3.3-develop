import 'package:base_project/data/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_list_response.g.dart';

part 'paginated_list_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedListResponse<T> with _$PaginatedListResponse<T> {
  const factory PaginatedListResponse({
    List<T>? content,
    bool? empty,
    bool? first,
    bool? last,
    int? number,
    int? numberOfElements,
    PageableResponse? pageable,
    int? size,
    SortResponse? sort,
    int? totalElements,
    int? totalPages,
  }) = _PaginatedListResponse;

  factory PaginatedListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginatedListResponseFromJson(json, fromJsonT);
}
