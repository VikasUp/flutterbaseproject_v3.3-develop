import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/index.dart';
import '/ui_components/index.dart';

import '../bloc/forgot_password.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();
  late ForgotPasswordBloc _bloc;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  void _backToLogin() {
    setState(() {
      _autoValidate = AutovalidateMode.disabled;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) =>
            Center(child: buildSafeArea(context, state)),
        listener: (context, state) {
          if (state is FpSuccess) {
            Utilities.displayToast(context, SFLStrings.message.kForgetPasswordEmailSent);
          } else if (state is FpFailure) {
            Utilities.displayInputDialogToGetInputForFirebaseConsoleCrashReport(context,
                exception: state.exception, stackTrace: state.stackTrace);
            Utilities.displayToast(context, state.error);
          }
        },
      );

  Widget buildSafeArea(BuildContext context, state) {
    if (state is FpInitial || state is FpFailure || state is FpSuccess) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (term) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return SFLStrings.message.kEnterEmail;
                  } else if (!Validator.isValidEmail(val)) {
                    return SFLStrings.message.kEnterValidEmail;
                  } else {
                    return null;
                  }
                },
                decoration: TextStyles.getInputDecoration().copyWith(
                  hintText: SFLStrings.hint.kEmail,
                ),
              ),
              SizedBox(height: SizeConfig.getScaledValue(24.0, context)),
              CustomAppButton(
                text: SFLStrings.button.kSendMyPassword,
                textColor: Colors.white,
                backgroundColor: Colors.deepOrange,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _bloc.add(
                      FpButtonPressed(
                        email: _emailController.text,
                        context: context,
                      ),
                    );
                  } else {
                    setState(() {
                      _autoValidate = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: SizeConfig.getScaledValue(6.0, context)),
              TextButton(
                child: Text(
                  SFLStrings.label.kBackToLogin,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black38,
                  ),
                ),
                onPressed: _backToLogin,
              ),
            ],
          ),
        ),
      );
    }
    if (state is FpLoading) {
      return const CircularProgressIndicator();
    }
    return const Text(
      'wait',
      style: TextStyle(color: Colors.black12),
    );
  }
}
