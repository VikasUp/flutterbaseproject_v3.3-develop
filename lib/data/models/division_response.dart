import 'package:base_project/data/models/teams_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'division_response.g.dart';
part 'division_response.freezed.dart';

@Freezed()
class DivisionResponse with _$DivisionResponse {
  const factory DivisionResponse({
    int? id,
    String? name,
    List<TeamResponse>? teams,
  }) = _DivisionResponse;

  factory DivisionResponse.fromJson(Map<String, dynamic> json) =>
      _$DivisionResponseFromJson(json);
}
