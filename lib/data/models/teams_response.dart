import 'package:freezed_annotation/freezed_annotation.dart';

part 'teams_response.g.dart';

part 'teams_response.freezed.dart';

@Freezed()
class TeamResponse with _$TeamResponse {
  const factory TeamResponse({
    int? id,
    String? name,
    String? imageUrl,
  }) = _TeamResponse;

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);
}
