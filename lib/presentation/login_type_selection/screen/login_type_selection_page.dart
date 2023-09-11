import 'package:base_project/core/constant/strings.dart';
import 'package:base_project/presentation/login_type_selection/screen/login_type_selection_screen.dart';
import 'package:flutter/material.dart';

class LoginTypeSelectionPage extends StatefulWidget {
  final bool isSessionExpire;
  const LoginTypeSelectionPage({this.isSessionExpire = false, Key? key})
      : super(key: key);

  @override
  _LoginTypeSelectionPageState createState() => _LoginTypeSelectionPageState();
}

class _LoginTypeSelectionPageState extends State<LoginTypeSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SFLStrings.screenTitle.kLoginTypeSelection,
        ),
      ),
      body:  LoginTypeSelectionScreen(
        isSessionExpire: widget.isSessionExpire,
      ),
    );
  }
}
