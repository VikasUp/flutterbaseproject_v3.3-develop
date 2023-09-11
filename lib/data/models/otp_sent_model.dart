import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_sent_model.g.dart';

part 'otp_sent_model.freezed.dart';

@Freezed()
class OtpSentModel with _$OtpSentModel {
  const factory OtpSentModel({
    String? message,
    int? httpStatus,
    int? applicationStatusCode,
    int? id,
    bool? userActive,
  }) = _OtpSentModel;

  factory OtpSentModel.fromJson(Map<String, dynamic> json) =>
      _$OtpSentModelFromJson(json);
}
