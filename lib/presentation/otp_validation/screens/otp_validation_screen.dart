import 'dart:async';

import 'package:base_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/core/constant/enums.dart';
import '/core/index.dart';
import '/presentation/edit_profile/screen/edit_profile_page.dart';
import '/presentation/otp_validation/bloc/otp_validation_bloc.dart';
import '/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import '/ui_components/custom_otp_fields/custom_otp_field.dart';
import '/ui_components/index.dart';

class OtpValidationScreen extends StatefulWidget {
  final String detailsOnWhichOTPWasSent;
  final RegistrationType? registrationType;
  final String? countryCode;

  const OtpValidationScreen({
    required this.detailsOnWhichOTPWasSent,
    required this.registrationType,
    this.countryCode,
    Key? key,
  }) : super(key: key);

  @override
  _OtpValidationScreenState createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  late RegisterWithOTPBloc _registerWithOTP;
  late OtpValidationBloc _otpValidationBloc;

  String? _email;
  String? _phoneNumber;
  int _seconds = 30;

  bool _isResendButtonVisible = false;
  String? currentText = "";

  Timer? timer;

  @override
  void initState() {
    _registerWithOTP = BlocProvider.of<RegisterWithOTPBloc>(context);
    _otpValidationBloc = BlocProvider.of<OtpValidationBloc>(context);

    _startTimer();
    super.initState();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setStateIfMounted(() {
          _seconds--;
          _isResendButtonVisible = false;
        });
      } else {
        timer.cancel();
        setStateIfMounted(() {
          _isResendButtonVisible = true;
        });
      }
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            SFLStrings.message.kWeHaveSentYouOTPOn,
            style: TextStyles.getH4Black(FontWeight.normal),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 12),
          child: RichText(
            text: TextSpan(
              text: widget.countryCode ?? "",
              style: TextStyles.getH5Black(FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: widget.countryCode == null ? "" : "-",
                  style: TextStyles.getH5Black(
                    FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: widget.detailsOnWhichOTPWasSent,
                  style: TextStyles.getH5Black(
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        MultiBlocListener(
          listeners: [
            BlocListener<RegisterWithOTPBloc, RegisterWithOTPState>(
              listener: (context, state) {
                if (state is SendOTPSuccess) {
                  Utilities.displayToast(
                      context, SFLStrings.message.kOTPSentSuccessfully);
                }
              },
            ),
            BlocListener<OtpValidationBloc, OtpValidationState>(
              listener: (context, state) {
                if (state is OtpValidationFailure) {
                  Utilities.displayToast(context, state.error.toString(),
                      isError: true);
                }
                if (state is OtpValidationSuccess) {
                  isNumeric(widget.detailsOnWhichOTPWasSent)
                      ? _phoneNumber = widget.detailsOnWhichOTPWasSent
                      : _email = widget.detailsOnWhichOTPWasSent;
                  if (state.isProfileComplete == true) {
                    _otpValidationBloc.add(StoreTokenEvent(token: state.token));
                    //Navigator.pushReplacementNamed(context, HomePage.tag);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          email: _email,
                          phoneNumber: _phoneNumber,
                          countryCode: widget.countryCode,
                          authToken: state.token,
                          isOtpRegistration: true,
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
          child: CustomOtpField(
            onChange: (value) {
              setState(() {
                currentText = value;
              });
            },
            length: 6,
            buildContext: context,
            backgroundColor: Colors.transparent,
            shape: PinCodeFieldShape.box,
            borderRadius: 5,
            borderWidth: 1,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.transparent,
            inactiveColor: ColorName.primarySwatch,
            selectedColor: Theme.of(context).primaryColor,
            selectedFillColor: Colors.transparent,
            activeColor: ColorName.primarySwatch,
            isObscure: true,
            obscureText: '*',
            animationType: AnimationType.fade,
            animationDuration: 300,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: CustomAppButton(
            backgroundColor: ColorName.primarySwatch,
            onPressed: () {
              if (currentText != null && currentText!.isNotEmpty) {
                if (currentText!.length == 6) {
                  _otpValidationBloc.add(
                    SubmitOTPEvent(
                      emailOrPhoneNumber: widget.detailsOnWhichOTPWasSent,
                      willBeOTPSentViaEmail:
                          widget.registrationType == RegistrationType.email
                              ? true
                              : false,
                      otp: currentText ?? "",
                    ),
                  );
                }
              }
            },
            text: SFLStrings.button.kSubmitOtp,
            textColor: Colors.white,
          ),
        ),
        TextButton(
          onPressed: _isResendButtonVisible
              ? () {
                  _registerWithOTP.add(
                    SendOTPButtonPressed(
                      emailOrPhoneNumber: widget.detailsOnWhichOTPWasSent,
                      channelName:
                          widget.registrationType == RegistrationType.email
                              ? SFLStrings.loginType.kEmail
                              : SFLStrings.loginType.kSms,
                      countyCode: widget.countryCode,
                    ),
                  );
                }
              : null,
          child: Text(
            _isResendButtonVisible
                ? SFLStrings.button.kResendOtp
                : "Resend OTP in $_seconds",
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(SFLStrings.button.kChangeInformation),
        ),
      ],
    );
  }
}
