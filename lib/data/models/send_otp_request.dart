import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_request.g.dart';

part 'send_otp_request.freezed.dart';

@Freezed()
class SendOTPRequest with _$SendOTPRequest {
  const factory SendOTPRequest({
    required String channel,
    required String to,
    String? countryDialCode,
  }) = _SendOTPRequest;

  factory SendOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOTPRequestFromJson(json);
}
