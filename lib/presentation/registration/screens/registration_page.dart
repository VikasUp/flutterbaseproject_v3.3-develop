import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/index.dart';
import '/injection_container.dart';
import '/presentation/registration/bloc/registration_bloc.dart';

import 'registration_form.dart';

class RegistrationPage extends StatelessWidget {
  static String tag = '/registration-screen';
  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOtpRegistration = ModalRoute.of(context)?.settings.arguments as bool;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(SFLStrings.screenTitle.kRegister),
        ),
        body: BlocProvider<RegistrationBloc>(
          create: (context) => serviceLocator<RegistrationBloc>(),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: RegistrationForm(
                isOtpRegistration: isOtpRegistration,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
