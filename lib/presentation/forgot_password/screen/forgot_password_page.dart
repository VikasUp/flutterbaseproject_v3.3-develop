import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/index.dart';
import '/injection_container.dart';
import '/presentation/forgot_password/bloc/forgot_password.dart';
import 'forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  static String tag = '/forgot-password-screen';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(SFLStrings.screenTitle.kForgotPassword),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocProvider<ForgotPasswordBloc>(
          create: (context) => serviceLocator<ForgotPasswordBloc>(),
          child: const SafeArea(
            child: ForgotPasswordForm(),
          ),
        ),
      );
}
