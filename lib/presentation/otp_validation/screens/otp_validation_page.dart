import 'package:base_project/data/models/NavigationModels/OTPParamModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

import '/core/constant/enums.dart';
import '/core/constant/index.dart';
import '/injection_container.dart';
import '/presentation/otp_validation/bloc/otp_validation_bloc.dart';
import '/presentation/otp_validation/screens/otp_validation_screen.dart';
import '/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';

class OtpValidationPage extends StatefulWidget {
  static String tag = '/otp-validation-screen';
  const OtpValidationPage({Key? key}) : super(key: key);

  @override
  _OtpValidationPageState createState() => _OtpValidationPageState();
}

class _OtpValidationPageState extends State<OtpValidationPage> {
  @override
  Widget build(BuildContext context) {
    OTPParamModel otpParamModel =
        ModalRoute.of(context)!.settings.arguments as OTPParamModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SFLStrings.screenTitle.kVerifyOtp,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<RegisterWithOTPBloc>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator<OtpValidationBloc>(),
          ),
        ],
        child: UpgradeAlert(
          upgrader: Upgrader(
              showIgnore: false, showLater: false, canDismissDialog: false),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: OtpValidationScreen(
                countryCode: otpParamModel.countryCode,
                detailsOnWhichOTPWasSent:
                    otpParamModel.detailsOnWhichOTPWasSent ?? "",
                registrationType: otpParamModel.registrationType,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
