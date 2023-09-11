import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';

part 'login_request.freezed.dart';

@Freezed()
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String username,
    required String password,
    required bool rememberMe,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
