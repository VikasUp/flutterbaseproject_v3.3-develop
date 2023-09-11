import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verify_response.g.dart';

part 'otp_verify_response.freezed.dart';

@Freezed()
class OTPVerifyResponse with _$OTPVerifyResponse {
  const factory OTPVerifyResponse({
    String? message,
    String? idToken,
    int? httpStatus,
    int? id,
    int? applicationStatusCode,
    bool? profileComplete,
  }) = _OTPVerifyResponse;

  factory OTPVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPVerifyResponseFromJson(json);
}
