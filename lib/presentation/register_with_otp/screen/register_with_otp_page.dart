import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/constant/index.dart';
import '/injection_container.dart';
import '/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import '/presentation/register_with_otp/screen/register_with_otp_screen.dart';

class RegisterWithOTPPage extends StatefulWidget {
  static String tag = '/register-with-otp';
  const RegisterWithOTPPage({Key? key}) : super(key: key);

  @override
  _RegisterWithOTPPageState createState() => _RegisterWithOTPPageState();
}

class _RegisterWithOTPPageState extends State<RegisterWithOTPPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(SFLStrings.screenTitle.kRegister),
          ),
          body: BlocProvider<RegisterWithOTPBloc>(
            create: (context) => serviceLocator<RegisterWithOTPBloc>(),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                child: const RegisterWithOTPScreen(),
              ),
            ),
          ),
        ),
      );
}
