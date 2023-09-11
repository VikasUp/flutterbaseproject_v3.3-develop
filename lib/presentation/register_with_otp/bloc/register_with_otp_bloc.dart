import 'dart:async';

import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/index.dart';
import '/core/usecase/usecase.dart';
import '/domain/entities/country_code.dart';
import '/domain/usecases/get_country_code.dart';
import '/domain/usecases/send_otp.dart';

part 'register_with_otp_event.dart';

part 'register_with_otp_state.dart';

class RegisterWithOTPBloc
    extends Bloc<RegisterWithOTPEvent, RegisterWithOTPState> {
  final GetCountryCode getCountryCode;
  final SendOTP sendOTP;

  RegisterWithOTPBloc(this.getCountryCode, this.sendOTP)
      : super(RegisterWithOTPInitial()) {
    on<SendOTPButtonPressed>(onSendOTPButtonPressed);
    on<GetCountryCodeEvent>(onGetCountryCodeEvent);
  }

  RegisterWithOTPState get initialState => RegisterWithOTPInitial();

  FutureOr<void> onSendOTPButtonPressed(
      SendOTPButtonPressed event, Emitter<RegisterWithOTPState> emit) async {
    emit(RegisterWithOTPLoading());

    final param = SendOTPParam(
        channel: event.channelName,
        to: event.emailOrPhoneNumber,
        countryCode: event.countyCode);
    final result = await sendOTP(param);
    result.fold((failure) async {
      if (failure is UnknownException) {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.catchErrorException);
      } else {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.serverException);
      }
      emit(SendOTPFailure(error: failure.toString()));
    }, (response) async {
      emit(SendOTPSuccess());
    });
  }

  FutureOr<void> onGetCountryCodeEvent(
      GetCountryCodeEvent event, Emitter<RegisterWithOTPState> emit) async {
    emit(RegisterWithOTPLoading());
    final result = await getCountryCode(NoParam());
    result.fold((failure) async {
      if (failure is UnknownException) {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.catchErrorException);
        emit(GetCountryCodeFailure(error: failure.toString()));
      } else {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.serverException);
        emit(GetCountryCodeFailure(error: failure.message));
      }
    }, (response) async {
      emit(GetCountryCodeSuccess(countryCode: response));
    });
  }
}
