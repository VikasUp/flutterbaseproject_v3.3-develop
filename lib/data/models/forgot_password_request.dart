import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request.g.dart';

part 'forgot_password_request.freezed.dart';

@Freezed()
class ForgotPasswordRequest with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({
    required String email,
  }) = _ForgotPasswordRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);
}
