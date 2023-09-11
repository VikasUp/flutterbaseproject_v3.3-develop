import 'package:base_project/core/constant/strings.dart';
import 'package:base_project/injection_container.dart';
import 'package:base_project/presentation/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:base_project/presentation/edit_profile/screen/edit_profile_screen.dart';
import 'package:base_project/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  static String tag = '/edit-profile-screen';
  final String? email;
  final String? phoneNumber;
  final String? countryCode;
  final String? authToken;
  final bool? isOtpRegistration;
  const EditProfilePage({
    Key? key,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.authToken,
    this.isOtpRegistration,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              SFLStrings.screenTitle.kEditProfile,
            ),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EditProfileBloc>(
                create: (context) => serviceLocator<EditProfileBloc>(),
              ),
              BlocProvider<RegisterWithOTPBloc>(
                create: (context) => serviceLocator<RegisterWithOTPBloc>(),
              ),
            ],
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                child: EditProfileScreen(
                  email: widget.email,
                  phoneNumber: widget.phoneNumber,
                  countryCode: widget.countryCode,
                  authToken: widget.authToken,
                  isOtpRegistration: widget.isOtpRegistration,
                ),
              ),
            ),
          ),
        ),
      );
}
