part of 'otp_validation_bloc.dart';

abstract class OtpValidationState extends Equatable {
  const OtpValidationState();

  @override
  List<Object> get props => [];
}

class OtpValidationInitial extends OtpValidationState {}

class OtpValidationLoading extends OtpValidationState {}

class OtpValidationSuccess extends OtpValidationState {
  final bool isProfileComplete;
  final String token;
  const OtpValidationSuccess({required this.token, required this.isProfileComplete});

  @override
  List<Object> get props => [isProfileComplete];
}

class OtpValidationFailure extends OtpValidationState {
  final String error;

  const OtpValidationFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegistrationFailure { error: $error }';
}
