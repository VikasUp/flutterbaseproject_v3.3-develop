import 'package:base_project/core/constant/enums.dart';
import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/core/index.dart';
import '/domain/usecases/otp_verify.dart';
import '/presentation/authentication/bloc/authentication.dart';

part 'otp_validation_event.dart';
part 'otp_validation_state.dart';

class OtpValidationBloc extends Bloc<OtpValidationEvent, OtpValidationState> {
  final AuthenticationBloc authenticationBloc;
  final OTPVerify otpVerify;

  OtpValidationBloc(this.otpVerify, this.authenticationBloc)
      : super(OtpValidationInitial()) {
    on<OtpValidationEvent>((event, emit) {
      emit(OtpValidationLoading());
    });
    on<StoreTokenEvent>((event, emit) {
      authenticationBloc.add(LoggedIn(token: event.token));
    });
    on<SubmitOTPEvent>((event, emit) async {
      emit(OtpValidationLoading());
      final channel = event.willBeOTPSentViaEmail
          ? SFLStrings.loginType.kEmail
          : SFLStrings.loginType.kSms;
      final param = OTPVerifyParam(
          channel: channel,
          countryDialCode: event.countryCode ?? '',
          to: event.emailOrPhoneNumber,
          otp: event.otp);
      final result = await otpVerify(param);
      result.fold((failure) async {
        if (failure is UnknownException) {
          FirebaseUtil.recordErrorWithType(
              failure, StackTrace.current, ExceptionType.catchErrorException);
        } else {
          FirebaseUtil.recordErrorWithType(
              failure, StackTrace.current, ExceptionType.serverException);
        }
        emit(
          OtpValidationFailure(
            error: failure.message,
          ),
        );
      }, (response) async {
        emit(OtpValidationSuccess(
            isProfileComplete: response.profileComplete ?? false,
            token: response.idToken ?? ''));
      });
    });
  }
}
