part of 'otp_validation_bloc.dart';

abstract class OtpValidationEvent extends Equatable {
  const OtpValidationEvent();
}

class SubmitOTPEvent extends OtpValidationEvent {
  final String emailOrPhoneNumber;
  final bool willBeOTPSentViaEmail;

  final String otp;
  final String? countryCode;

  const SubmitOTPEvent({
    required this.emailOrPhoneNumber,
    required this.willBeOTPSentViaEmail,
    required this.otp,
    this.countryCode,
  });

  @override
  List<Object?> get props => [
        emailOrPhoneNumber,
        willBeOTPSentViaEmail,
        otp,
        countryCode,
      ];
}

class StoreTokenEvent extends OtpValidationEvent {
  final String token;

  const StoreTokenEvent({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'StoreToken { token: $token }';
}
