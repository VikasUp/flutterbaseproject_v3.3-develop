import 'package:equatable/equatable.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class FpInitial extends ForgotPasswordState {}

class FpLoading extends ForgotPasswordState {}

class FpSuccess extends ForgotPasswordState {}

class FpFailure extends ForgotPasswordState {
  final String error;
  final Object? exception;
  final StackTrace? stackTrace;

  const FpFailure({required this.error, this.exception, this.stackTrace});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FpFailure { error: $error, exception: $exception, stackTrace: $stackTrace }';
}
