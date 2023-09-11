import 'package:base_project/core/index.dart';
import 'package:flutter/material.dart';

import '../../../core/navigator.dart';
import '/core/constant/enums.dart';
import '/core/constant/index.dart';
import '/core/constant/point_size.dart';
import '/presentation/login/screen/login_page.dart';
import '/presentation/register_with_otp/screen/register_with_otp_page.dart';
import '/presentation/registration/screens/registration_page.dart';
import '/ui_components/custom_button/custom_button.dart';

class LoginTypeSelectionScreen extends StatefulWidget {
  final bool isSessionExpire;

  const LoginTypeSelectionScreen({
    required this.isSessionExpire,
    Key? key,
  }) : super(key: key);

  @override
  _LoginTypeSelectionScreenState createState() =>
      _LoginTypeSelectionScreenState();
}

class _LoginTypeSelectionScreenState extends State<LoginTypeSelectionScreen> {
  @override
  void initState() {
    super.initState();
    showToastIfSessionExpire();
  }

  void showToastIfSessionExpire() {
    if (widget.isSessionExpire) {
      Utilities.displayToast(
          context, SFLStrings.message.kSessionExpiredMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        //height: SizeConfig.screenHeight / 4,
        width: SizeConfig.screenWidth - SizeConfig.safeAreaVertical,
        child: _buildButtonsColumn(),
      ),
    );
  }

  Widget _buildButtonsColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLoginButtons(
          buttonText: SFLStrings.button.kLoginOrRegisterWithOTP,
          buttonType: ButtonType.loginWithOTP,
        ),
        SizedBox(
          height: PointSize.value8,
        ),
        _buildLoginButtons(
          buttonText: SFLStrings.button.kLoginWithPassword,
          buttonType: ButtonType.loginWithPassword,
        ),
        SizedBox(
          height: PointSize.value8,
        ),
        const SizedBox(),
        _buildLoginButtons(
          buttonText: SFLStrings.button.kRegisterWithPassword,
          buttonType: ButtonType.registerWithPassword,
        ),
      ],
    );
  }

  Widget _buildLoginButtons({
    String? buttonText,
    ButtonType? buttonType,
  }) {
    return CustomAppButton(
      text: buttonText ?? SFLStrings.button.kLoginOrRegisterWithOTP,
      textColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      onPressed: () => _selectLoginType(
        buttonType: buttonType!,
        context: context,
      ),
    );
  }
}

void _selectLoginType({
  required ButtonType buttonType,
  required BuildContext context,
}) {
  switch (buttonType) {
    case ButtonType.loginWithOTP:
      AppNavigator.instance.navigateTo(RegisterWithOTPPage.tag);
      break;
    case ButtonType.loginWithPassword:
      AppNavigator.instance.navigateTo(LoginPage.tag);
      break;
    default:
      AppNavigator.instance.navigateTo(RegistrationPage.tag, arguments: true);
      break;
  }
}
