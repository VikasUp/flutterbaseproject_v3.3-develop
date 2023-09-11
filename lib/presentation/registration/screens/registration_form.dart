import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/index.dart';
import '/presentation/registration/bloc/registration_bloc.dart';
import '/ui_components/index.dart';

class RegistrationForm extends StatefulWidget {
  final bool? isOtpRegistration;

  const RegistrationForm({
    Key? key,
    this.isOtpRegistration,
  }) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late RegistrationBloc _bloc;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _firstNamedFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late String _userName;
  late String _password;
  late String _email;
  late String _firstName;
  late String _lastName;
  late int _phoneNumber;

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<RegistrationBloc>(context);
  }

  void _redirectToLoginPage() {
    _fieldFocusChange(context, _passwordFocus, FocusNode());
    _formKey.currentState?.reset();
    setState(() {
      _autoValidateMode = AutovalidateMode.disabled;
    });
    Navigator.pop(context);
  }

  String? _validateEmail(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val ?? "")) {
      return SFLStrings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  String? _validatePassword(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(val ?? "")) {
      return SFLStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  String? _validateConfirmPassword(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterPassword;
    } else if (_password != val) {
      return SFLStrings.message.kPasswordDoNotMatch;
    } else {
      return null;
    }
  }

  String? _validateUserName(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterUsername;
    } else {
      return null;
    }
  }

  String? _validatePhoneNumber(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterPhoneNumber;
    } else if (val?.trim().length != 10 || !isNumeric(val)) {
      return SFLStrings.message.kEnterValidPhoneNumber;
    } else {
      return null;
    }
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? _validateFirstName(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterFirstName;
    } else {
      return null;
    }
  }

  String? _validateLastName(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterLastName;
    } else {
      return null;
    }
  }

  void _onRegisterButtonPressed() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());
      _bloc.add(
        RegisterButtonPressed(
          context: context,
          email: _email,
          userName: _userName,
          password: _password,
          firstName: _firstName,
          lastName: _lastName,
          phoneNumber: _phoneNumber,
          status: true,
        ),
      );
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
        if (state is RegistrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  state.error,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
        if (state is RegistrationSuccess) {
          _displaySnackBar("User registered successfully");
          _autoValidateMode = AutovalidateMode.disabled;
          Timer(const Duration(milliseconds: 2500), () {
            _formKey.currentState?.reset();
            Navigator.pop(context);
          });
        }
      }, builder: (context, state) {
        if (state is RegistrationLoading) {
          return const LoadingIndicator();
        }
        return
            //If we are registering with password this tree will get displayed
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
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _emailFocus, _passwordFocus);
                    },
                    validator: _validateEmail,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kEmail,
                    ),
                    onSaved: (value) => _email = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    obscureText: true,
                    focusNode: _passwordFocus,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _passwordFocus, _confirmPasswordFocus);
                    },
                    validator: _validatePassword,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kPassword,
                    ),
                    onSaved: (value) => _password = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    obscureText: true,
                    focusNode: _confirmPasswordFocus,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _confirmPasswordFocus, _firstNamedFocus);
                    },
                    validator: _validateConfirmPassword,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kConfirmPassword,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    focusNode: _firstNamedFocus,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _firstNamedFocus, _lastNameFocus);
                    },
                    validator: _validateFirstName,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kFirstName,
                    ),
                    onSaved: (value) => _firstName = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    focusNode: _lastNameFocus,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _lastNameFocus, _userNameFocus);
                    },
                    validator: _validateLastName,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kLastName,
                    ),
                    onSaved: (value) => _lastName = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _userNameFocus, _phoneNumberFocus);
                    },
                    validator: _validateUserName,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kUserName,
                    ),
                    onSaved: (value) => _userName = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    focusNode: _phoneNumberFocus,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _onRegisterButtonPressed();
                    },
                    validator: _validatePhoneNumber,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kPhone,
                    ),
                    onSaved: (value) {
                      if (value?.isNotEmpty ?? false) {
                        _phoneNumber = int.parse(value!);
                      }
                    },
                  ),
                  const SizedBox(height: 12.0),
                  CustomAppButton(
                    text: SFLStrings.button.kRegister,
                    textColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    onPressed: _onRegisterButtonPressed,
                  ),
                  TextButton(
                    child: Text(
                      SFLStrings.label.kAlreadyMember,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    onPressed: _redirectToLoginPage,
                  ),
                ],
              ),
            ),
          ),
        );
      });

  void _displaySnackBar(String message, {bool isError = false}) {
    Utilities.displayToast(context, message, isError: isError);
  }
}
