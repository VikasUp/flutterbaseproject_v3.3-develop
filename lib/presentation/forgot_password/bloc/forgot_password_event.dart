import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class FpButtonPressed extends ForgotPasswordEvent {
  final String email;
  final BuildContext context;

  const FpButtonPressed({
    required this.email,
    required this.context,
  });

  @override
  List<Object> get props => [email];
}

class BackToLoginPressed extends ForgotPasswordEvent {
  const BackToLoginPressed();
  @override
  List<Object> get props => [];
}
