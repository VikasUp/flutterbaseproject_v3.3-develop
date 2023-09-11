import 'package:base_project/core/firebase/index.dart';
import 'package:base_project/data/models/NavigationModels/OTPParamModel.dart';
import 'package:base_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/constant/enums.dart';
import '/core/index.dart';
import '/domain/entities/country_code.dart';
import '/presentation/otp_validation/screens/otp_validation_page.dart';
import '/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import '/ui_components/custom_button/custom_button.dart';

class RegisterWithOTPScreen extends StatefulWidget {
  const RegisterWithOTPScreen({Key? key}) : super(key: key);

  @override
  _RegisterWithOTPScreenState createState() => _RegisterWithOTPScreenState();
}

class _RegisterWithOTPScreenState extends State<RegisterWithOTPScreen> {
  late RegisterWithOTPBloc _bloc;
  final TextEditingController _phoneOrEmailFieldController =
      TextEditingController();

  bool _isValidEmailForOTP = false;
  bool _isValidPhoneNumberForOTP = false;
  int _indexOfSelectedCountryCode = 0;

  final List<String> _listOfCountryCodes = [];

  List<CountryCode> _listOfCountyCodesAndName = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<RegisterWithOTPBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _postFrameCallback(),
    );
  }

  void _postFrameCallback() {
    _fetchCountryCode(isNewCall: true);
  }

  void _fetchCountryCode({required bool isNewCall}) {
    _bloc.add(
      const GetCountryCodeEvent(),
    );
  }

  String? _checkEmailOrPhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return SFLStrings.message.kEnterEmailOrPhoneNumber;
    } else {
      if (isNumeric(val)) {
        return _validatePhoneNumber(val);
      } else {
        return _validateEmail(val);
      }
    }
  }

  String? _validateEmail(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val ?? "")) {
      return SFLStrings.message.kEnterValidEmail;
    } else {
      _isValidPhoneNumberForOTP = false;
      _isValidEmailForOTP = true;
      return null;
    }
  }

  String? _validatePhoneNumber(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return SFLStrings.message.kEnterPhoneNumber;
    } else if (val?.trim().length != 10 || !isNumeric(val)) {
      return SFLStrings.message.kEnterValidPhoneNumber;
    } else {
      _isValidEmailForOTP = false;
      _isValidPhoneNumberForOTP = true;
      return null;
    }
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void _onSendOTPPress() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      if (_isValidEmailForOTP) {
        _bloc.add(
          SendOTPButtonPressed(
            emailOrPhoneNumber: _phoneOrEmailFieldController.text,
            channelName: SFLStrings.loginType.kEmail,
          ),
        );
      }
      if (_isValidPhoneNumberForOTP) {
        if (_listOfCountyCodesAndName.isNotEmpty) {
          _bloc.add(
            SendOTPButtonPressed(
              emailOrPhoneNumber: _phoneOrEmailFieldController.text,
              channelName: SFLStrings.loginType.kSms,
              countyCode: _listOfCountyCodesAndName[_indexOfSelectedCountryCode]
                  .countryCode,
            ),
          );
        }
      }
    }
  }

  void _textFormFieldOnChange(value) {
    setState(() {
      String? validPhoneNumber = _validatePhoneNumber(value);
      if (validPhoneNumber == null) {
        _isValidPhoneNumberForOTP = true;
      } else {
        _isValidPhoneNumberForOTP = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterWithOTPBloc, RegisterWithOTPState>(
      listener: (context, state) {
        if (state is SendOTPSuccess) {
          Utilities.displayToast(
              context, SFLStrings.message.kOTPSentSuccessfully);

          var otpParamModel = OTPParamModel();
          otpParamModel.countryCode =
              isNumeric(_phoneOrEmailFieldController.text)
                  ? _listOfCountyCodesAndName[_indexOfSelectedCountryCode]
                      .countryCode
                  : null;
          otpParamModel.registrationType =
              isNumeric(_phoneOrEmailFieldController.text)
                  ? RegistrationType.phoneNumber
                  : RegistrationType.email;
          otpParamModel.detailsOnWhichOTPWasSent =
              _phoneOrEmailFieldController.text;

          AppNavigator.instance
              .navigateTo(OtpValidationPage.tag, arguments: otpParamModel);
        }
        if (state is GetCountryCodeSuccess) {
          setState(() {
            _listOfCountyCodesAndName = state.countryCode;
            // _indexOfSelectedCountryCode = _listOfCountyCodesAndName
            //     .indexWhere((element) => element.name == "Canada");
            for (var code in state.countryCode) {
              _listOfCountryCodes.add(code.countryCode + "," + code.name);
            }
          });
        }
        if (state is SendOTPFailure) {
          Utilities.displayToast(context, state.error, isError: true);
        }
        if (state is GetCountryCodeFailure) {
          Utilities.displayToast(
              context, SFLStrings.message.kErrorWhileFetchingCountryCodes,
              isError: true);
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  _buildEmailOrPhoneNumberFormField(),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomAppButton(
                  text: SFLStrings.button.kSendOTP,
                  textColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  onPressed: _onSendOTPPress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailOrPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneOrEmailFieldController,
      obscureText: false,
      textInputAction: TextInputAction.done,
      validator: _checkEmailOrPhoneNumber,
      inputFormatters: [
        LengthLimitingTextInputFormatter(_isValidPhoneNumberForOTP ? 10 : 25),
      ],
      decoration: TextStyles.getInputDecoration().copyWith(
        hintText: SFLStrings.hint.kEnterEmailOrPhoneNumber,
        prefix: _isValidPhoneNumberForOTP
            ? InkWell(
                onTap: _buildCountryCodeSelectionDialogBox,
                child: _buildCountryCodeSelectionOptions(),
              )
            : const SizedBox(),
      ),
      onChanged: _textFormFieldOnChange,
    );
  }

  Widget _buildCountryCodeSelectionOptions() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Text(
        _listOfCountyCodesAndName[_indexOfSelectedCountryCode].countryCode,
        style: TextStyles.getH4(
          ColorName.primarySwatch,
          FontWeight.normal,
          FontStyle.normal,
        ),
      ),
    );
  }

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
        //contentPadding: EdgeInsets.zero,
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
                    setState(() {
                      _indexOfSelectedCountryCode = index;
                    });
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
}
