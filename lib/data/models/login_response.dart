import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

part 'login_response.freezed.dart';

@Freezed()
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') String? idToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
