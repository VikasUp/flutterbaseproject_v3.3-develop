import 'package:base_project/data/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable_response.g.dart';

part 'pageable_response.freezed.dart';

@Freezed()
class PageableResponse with _$PageableResponse {
  const factory PageableResponse({
    int? offset,
    int? pageNumber,
    int? pageSize,
    bool? paged,
    SortResponse? sort,
    bool? unpaged,
  }) = _PageableResponse;

  factory PageableResponse.fromJson(Map<String, dynamic> json) =>
      _$PageableResponseFromJson(json);
}
