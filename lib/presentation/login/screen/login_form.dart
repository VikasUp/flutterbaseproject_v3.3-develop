import 'package:base_project/core/constant/size_config.dart';
import 'package:base_project/core/constant/strings.dart';
import 'package:base_project/core/constant/text_styles.dart';
import 'package:base_project/core/navigator.dart';
import 'package:base_project/core/util/validators.dart';
import 'package:base_project/presentation/forgot_password/screen/forgot_password_page.dart';
import 'package:base_project/presentation/home/screen/home_page.dart';
import 'package:base_project/presentation/login/bloc/login_bloc.dart';
import 'package:base_project/presentation/login/bloc/login_event.dart';
import 'package:base_project/presentation/login/bloc/login_state.dart';
import 'package:base_project/presentation/registration/screens/registration_page.dart';
import 'package:base_project/ui_components/app_version_component/app_version_text.dart';
import 'package:base_project/ui_components/custom_button/custom_button.dart';
import 'package:base_project/ui_components/loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class _LoginFormState extends State<LoginForm> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late LoginBloc _bloc;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  late String _userName;
  late String _password;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<LoginBloc>(context);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _onLoginButtonPressed() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState!.save();
      _bloc.add(
        LoginButtonPressed(
          context: context,
          username: _userName,
          password: _password,
        ),
      );
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  void _redirectToForgotPassword() {
    _fieldFocusChange(context, _passwordFocus, FocusNode());
    _formKey.currentState!.reset();
    setState(() {
      _autoValidateMode = AutovalidateMode.disabled;
    });
    AppNavigator.instance.navigateTo(ForgotPasswordPage.tag);
  }

  void _redirectToRegistrationPage() {
    _fieldFocusChange(context, _passwordFocus, FocusNode());
    _formKey.currentState!.reset();
    setState(() {
      _autoValidateMode = AutovalidateMode.disabled;
    });
    AppNavigator.instance.navigateTo(RegistrationPage.tag);
  }

  String? _validatePassword(String? val) {
    if (val!.trim().isEmpty) {
      return SFLStrings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(val)) {
      return SFLStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  String? _validateEmail(String? val) {
    if (val!.trim().isEmpty) {
      return SFLStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val)) {
      return SFLStrings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<LoginBloc, LoginState>(
      key: _scaffoldKey,
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  state.error,
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is LoginSuccess) {
          _autoValidateMode = AutovalidateMode.disabled;
          AppNavigator.instance.replaceWith(HomePage.tag);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const LoadingIndicator();
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autoValidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _userName = value?.trim() ?? "",
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, _emailFocus, _passwordFocus);
                        },
                        validator: _validateEmail,
                        decoration: TextStyles.getInputDecoration().copyWith(
                          hintText: SFLStrings.hint.kEmail,
                        ),
                      ),
                      SizedBox(
                          height: SizeConfig.getScaledValue(12.0, context)),
                      TextFormField(
                        obscureText: true,
                        focusNode: _passwordFocus,
                        textInputAction: TextInputAction.go,
                        onSaved: (value) => _password = value?.trim() ?? "",
                        onFieldSubmitted: (term) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _onLoginButtonPressed();
                        },
                        validator: _validatePassword,
                        decoration: TextStyles.getInputDecoration().copyWith(
                          hintText: SFLStrings.hint.kPassword,
                        ),
                      ),
                      SizedBox(
                          height: SizeConfig.getScaledValue(12.0, context)),
                      CustomAppButton(
                        text: SFLStrings.button.kLogin,
                        textColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        onPressed: _onLoginButtonPressed,
                      ),
                      TextButton(
                        child: Text(
                          SFLStrings.label.kForgotYourPassword,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        onPressed: _redirectToForgotPassword,
                      ),
                      SizedBox(height: SizeConfig.getScaledValue(5.0, context)),
                      TextButton(
                        child: Text(
                          SFLStrings.label.kRegister,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        onPressed: _redirectToRegistrationPage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 10.0,
              child: AppVersionText(),
            ),
          ],
        );
      });
}
