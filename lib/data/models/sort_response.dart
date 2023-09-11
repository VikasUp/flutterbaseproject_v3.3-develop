import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_response.g.dart';

part 'sort_response.freezed.dart';

@Freezed()
class SortResponse with _$SortResponse {
  const factory SortResponse({
    bool? sorted,
    bool? empty,
    bool? unsorted,
  }) = _SortResponse;

  factory SortResponse.fromJson(Map<String, dynamic> json) =>
      _$SortResponseFromJson(json);
}
