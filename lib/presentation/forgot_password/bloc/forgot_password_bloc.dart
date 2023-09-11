import 'dart:async';

import 'package:base_project/core/constant/enums.dart';
import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:bloc/bloc.dart';

import '/core/app_config.dart';
import '/core/constant/strings.dart';
import '/core/error/exception.dart';
import '/domain/usecases/forgot_password.dart';
import '/presentation/authentication/bloc/authentication.dart';
import 'forgot_password.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthenticationBloc authenticationBloc;
  final ForgotPassword forgotPassword;

  ForgotPasswordBloc(
      {required this.authenticationBloc, required this.forgotPassword})
      : super(FpInitial()) {
    on<FpButtonPressed>(onFpButtonPressed);
  }

  ForgotPasswordState get initialState => FpInitial();

  FutureOr<void> onFpButtonPressed(
      FpButtonPressed event, Emitter<ForgotPasswordState> emit) async {
    emit(FpLoading());
    final param = ForgotPasswordParam(event.email);
    final result = await forgotPassword(param);
    result.fold((failure) async {
      if (failure is UnknownException) {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.catchErrorException);
        if (AppConfig.getInstance().flavor == Environment.develop) {
          emit(FpFailure(
              error: SFLStrings.message.kReportSentSuccessfully,
              exception: failure,
              stackTrace: StackTrace.current));
        } else {
          emit(FpFailure(
              error: failure.toString(),
              exception: failure,
              stackTrace: StackTrace.current));
          emit(FpInitial());
        }
      } else if (failure is UnauthorisedException) {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.unauthorisedException);
        emit(FpFailure(error: failure.toString()));
        Future.delayed(const Duration(milliseconds: 3000), () {
          authenticationBloc.add(LoggedOut());
        });
      } else {
        FirebaseUtil.recordErrorWithType(
            failure, StackTrace.current, ExceptionType.serverException);
        emit(FpFailure(error: failure.toString()));
      }
    }, (success) async {
      emit(FpSuccess());
    });
  }
}
