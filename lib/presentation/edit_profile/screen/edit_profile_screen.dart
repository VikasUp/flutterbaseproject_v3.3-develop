import 'package:base_project/core/index.dart';
import 'package:base_project/core/navigator.dart';
import 'package:base_project/domain/entities/country_code.dart';
import 'package:base_project/gen/colors.gen.dart';
import 'package:base_project/presentation/authentication/bloc/authentication.dart';
import 'package:base_project/presentation/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:base_project/presentation/home/bloc/home.dart';
import 'package:base_project/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import 'package:base_project/ui_components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfl_widgets/sfl_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  final bool? isOtpRegistration;
  final String? email;
  final String? phoneNumber;
  final String? countryCode;
  final String? authToken;

  const EditProfileScreen({
    Key? key,
    this.isOtpRegistration = false,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.authToken,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //late RegistrationBloc _bloc;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNamedFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late String _email;
  late String _firstName;
  late String _lastName;
  late int _phoneNumber;
  late String _countryCode;

  late EditProfileBloc _editProfileBloc;
  late RegisterWithOTPBloc _registerWithOTPBloc;

  bool _isValidPhoneNumberForOTP = false;

  List<CountryCode> _listOfCountyCodesAndName = [];
  final List<String> _listOfCountryCodes = [];

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    super.initState();
    _editProfileBloc = BlocProvider.of<EditProfileBloc>(context);
    _registerWithOTPBloc = BlocProvider.of<RegisterWithOTPBloc>(context);
    if (widget.phoneNumber == null) {
      _registerWithOTPBloc.add(
        const GetCountryCodeEvent(),
      );
    } else {
      _countryCode = widget.countryCode ?? '';
    }
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

  String? _validatePhoneNumber(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterPhoneNumber;
    } else if (val?.trim().length != 10 || !isNumeric(val)) {
      return SFLStrings.message.kEnterValidPhoneNumber;
    } else {
      //setState(() {
      _isValidPhoneNumberForOTP = true;
      //});

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

  void _onUpdateButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      _editProfileBloc.add(
        EditProfilePressed(
          email: _email,
          firstName: _firstName,
          lastName: _lastName,
          phoneNumber: _phoneNumber,
          countryCode: _countryCode,
          authToken: widget.authToken,
        ),
      );
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<EditProfileBloc, EditProfileState>(
            listener: (context, state) {
              if (state is EditProfileSuccess) {
                if (widget.isOtpRegistration == true) {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(LoggedIn(token: widget.authToken ?? ''));
                  AppNavigator.instance.replaceWith(HomePage.tag);
                } else {
                  SFLToast.display(
                      context: context, message: "Profile Update Successfully");
                }
              }
            },
          ),
          BlocListener<RegisterWithOTPBloc, RegisterWithOTPState>(
              listener: (context, state) {
            if (state is GetCountryCodeSuccess) {
              setState(() {
                _listOfCountyCodesAndName = state.countryCode;
                _countryCode = _listOfCountyCodesAndName.first.countryCode;
                for (var code in state.countryCode) {
                  _listOfCountryCodes.add(code.countryCode + "," + code.name);
                }
              });
            }
          }),
        ],
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    focusNode: _firstNamedFocus,
                    textInputAction: TextInputAction.next,
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
                      _fieldFocusChange(context, _lastNameFocus, _emailFocus);
                    },
                    validator: _validateLastName,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kLastName,
                    ),
                    onSaved: (value) => _lastName = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    initialValue: widget.email,
                    enabled: widget.email == null ? true : false,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _emailFocus, _phoneNumberFocus);
                    },
                    validator: _validateEmail,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kEmail,
                    ),
                    onSaved: (value) => _email = value?.trim() ?? "",
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    focusNode: _phoneNumberFocus,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (term) {
                      _onUpdateButtonPressed();
                    },
                    initialValue: widget.phoneNumber,
                    enabled: widget.phoneNumber == null ? true : false,
                    validator: _validatePhoneNumber,
                    decoration: TextStyles.getInputDecoration().copyWith(
                      hintText: SFLStrings.hint.kPhone,
                      prefix: _isValidPhoneNumberForOTP
                          ? InkWell(
                              onTap: _buildCountryCodeSelectionDialogBox,
                              child: _buildCountryCodeSelectionOptions(),
                            )
                          : const SizedBox(),
                    ),
                    onChanged: _validatePhoneNumber,
                    onSaved: (value) {
                      if (value?.isNotEmpty ?? false) {
                        _phoneNumber = int.parse(value!);
                      }
                    },
                  ),
                  const SizedBox(height: 12.0),
                  CustomAppButton(
                    text: SFLStrings.button.kUpdate,
                    textColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    onPressed: _onUpdateButtonPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _buildCountryCodeSelectionDialogBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        backgroundColor: Colors.white,
        content: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: SizeConfig.screenWidth * 0.9,
            child: Scaffold(
              body: ListView.separated(
                separatorBuilder: (context, index) => Container(
                  height: 0.2,
                  color: ColorName.primarySwatch,
                ),
                addRepaintBoundaries: false,
                itemCount: _listOfCountryCodes.length,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _listOfCountryCodes[index].split(",").last,
                            maxLines: 3,
                            style: TextStyles.getH4(
                              ColorName.primarySwatch,
                              FontWeight.normal,
                              FontStyle.normal,
                            ),
                          ),
                        ),
                        Text(
                          _listOfCountryCodes[index].split(",").first,
                          textAlign: TextAlign.right,
                          style: TextStyles.getH4(
                            ColorName.primarySwatch,
                            FontWeight.normal,
                            FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryCodeSelectionOptions() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Text(
        _countryCode,
        style: TextStyles.getH4(
          ColorName.primarySwatch,
          FontWeight.normal,
          FontStyle.normal,
        ),
      ),
    );
  }
}
