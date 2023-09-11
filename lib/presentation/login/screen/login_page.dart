import 'package:base_project/core/constant/strings.dart';
import 'package:base_project/injection_container.dart';
import 'package:base_project/presentation/login/bloc/login_bloc.dart';
import 'package:base_project/presentation/login/screen/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

class LoginPage extends StatelessWidget {
  static String tag = '/login-screen';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(SFLStrings.screenTitle.kLogin),
        ),
        body: BlocProvider<LoginBloc>(
          create: (context) => serviceLocator<LoginBloc>(),
          child: UpgradeAlert(
            upgrader: Upgrader(
              showIgnore: false,
              showLater: false,
              canDismissDialog: false
            ),
            
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                child: const LoginForm(),
              ),
            ),
          ),
        ),
      );
}
