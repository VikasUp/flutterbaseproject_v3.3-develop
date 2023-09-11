import 'dart:async';
import 'package:base_project/core/util/utilities.dart';
import 'package:base_project/domain/usecases/user_register.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRegister userRegister;

  RegistrationBloc(this.userRegister) : super(RegistrationInitial()) {
    on<RegisterButtonPressed>(onRegisterButtonPressed);
  }

  RegistrationState get initialState => RegistrationInitial();

  FutureOr<void> onRegisterButtonPressed(
      RegisterButtonPressed event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    final param = UserRegisterParam(event.email, event.password,
        event.firstName, event.lastName, event.userName, event.phoneNumber);
    final result = await userRegister(param);
    result.fold((failure) async {
      Utilities.addLogOnFailure(failure);
      emit(RegistrationFailure(error: failure.toString()));
      emit(RegistrationInitial());
    }, (isSuccess) async {
      emit(RegistrationSuccess());
    });
  }
}
