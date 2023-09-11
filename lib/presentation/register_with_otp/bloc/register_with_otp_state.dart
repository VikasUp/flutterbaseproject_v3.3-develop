part of 'register_with_otp_bloc.dart';


abstract class RegisterWithOTPState extends Equatable {
  const RegisterWithOTPState();

  @override
  List<Object> get props => [];
}

class RegisterWithOTPInitial extends RegisterWithOTPState {}

class RegisterWithOTPLoading extends RegisterWithOTPState {}

class SendOTPSuccess extends RegisterWithOTPState {}

class SendOTPFailure extends RegisterWithOTPState {
  final String error;

  const SendOTPFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SendOTPFailure { error: $error }';
}

class GetCountryCodeSuccess extends RegisterWithOTPState {
  final List<CountryCode> countryCode;

  const GetCountryCodeSuccess({
    required this.countryCode,
  });

  @override
  List<Object> get props => [
        countryCode,
      ];
}

class GetCountryCodeFailure extends RegisterWithOTPState {
  final String error;

  const GetCountryCodeFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SendOTPFailure { error: $error }';
}
