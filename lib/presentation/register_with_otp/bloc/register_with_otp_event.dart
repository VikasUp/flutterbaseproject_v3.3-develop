part of 'register_with_otp_bloc.dart';

abstract class RegisterWithOTPEvent extends Equatable {
  const RegisterWithOTPEvent();
}

class SendOTPButtonPressed extends RegisterWithOTPEvent {
  final String emailOrPhoneNumber;
  final String? countyCode;
  final String channelName;

  const SendOTPButtonPressed({
    required this.emailOrPhoneNumber,
    required this.channelName,
    this.countyCode,
  });

  @override
  List<Object?> get props => [
        emailOrPhoneNumber,
        channelName,
        countyCode,
      ];
}

class GetCountryCodeEvent extends RegisterWithOTPEvent {
  const GetCountryCodeEvent();

  @override
  List<Object?> get props => [];
}
