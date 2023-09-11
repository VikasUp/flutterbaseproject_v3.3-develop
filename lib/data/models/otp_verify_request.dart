import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verify_request.g.dart';

part 'otp_verify_request.freezed.dart';

@Freezed()
class OTPVerifyRequest with _$OTPVerifyRequest {
  const factory OTPVerifyRequest({
    String? channel,
    String? countryDialCode,
    String? to,
    String? otp,
  }) = _OTPVerifyRequest;

  factory OTPVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OTPVerifyRequestFromJson(json);
}
