import 'dart:async';
import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MethodChannel, rootBundle;
import 'package:sfl_widgets/sfl_widgets.dart';

import '/core/index.dart';

const kAlert = "Alert";
const kStart = "Start";
const kOk = "Ok";
const kTest = "Test";
const kCancel = "Cancel";
const kHintText = "hint text";

class Utilities {
  static Future<String> parseStringFromAssets(String assetsPath) {
    log.info('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath);
  }

  static Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) {
    log.info('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  static Future<List<dynamic>> parseJsonArrayFromAssets(String assetsPath) {
    log.info('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  static Future<String?> getDeviceIdentifier() async {
    final deviceId = await MethodChannel(SFLStrings.channel.kApp)
        .invokeMethod<String>(SFLStrings.channelMethod.kDeviceId);
    return deviceId;
  }

  ///Enum to String function
  static String enumToString(Object o) => describeEnum(o);

  ///String to Enum function
  static T enumFromString<T>(String key, List<T> values) => values.firstWhere(
        (v) => key == enumToString(v!),
      );

  static void displayToast(BuildContext context, String message,
      {bool isError = false}) {
    SFLToast.display(
      context: context,
      duration: const Duration(milliseconds: 3000),
      direction: ToastDirection.bottom,
      messageContainerColor:
          isError ? Colors.red.shade600 : Colors.green.shade600,
      message: message,
      messageStyle: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static void displayAlert(BuildContext context,
      {required VoidCallback positiveCallback,
      required VoidCallback negativeCallback,
      String title = kAlert,
      String message = kTest,
      String positiveButtonText = kOk,
      String negativeButtonText = kCancel}) {
    SFLDialog.display(
        context: context,
        message: message,
        title: title,
        positiveButtonText: positiveButtonText,
        negativeButtonText: negativeButtonText,
        positiveButtonCallBack: positiveCallback,
        negativeButtonCallBack: negativeCallback,
        type: SFLDialogType.PlatformSpecific);
  }

  static Future<String> showTextFieldDialog(BuildContext context,
      {String? title, String? message}) async {
    final text = await (showTextInputDialog(
      context: context,
      textFields: const [
        DialogTextField(
          hintText: kHintText,
        ),
      ],
      title: title,
      message: message,
    ) as FutureOr<List<String>>);
    return text.first;
  }

  static Future<String?> showListOfAction(
      {required BuildContext context,
      required List<String> actions,
      String? title,
      String? message}) async {
    final option = await showModalActionSheet<String>(
      context: context,
      title: title,
      message: message,
      materialConfiguration: const MaterialModalActionSheetConfiguration(),
      actions: List.generate(
        actions.length,
        (index) => SheetAction(
          icon: Icons.info,
          label: actions[index],
          key: actions[index],
        ),
      ),
    );
    return option;
  }

  /// AlertDialog will be displayed to take additional input for exception
  /// received during development phase in development build only.
  static Future<bool?>
      displayInputDialogToGetInputForFirebaseConsoleCrashReport(
          BuildContext context,
          {Object? exception,
          StackTrace? stackTrace}) async {
    final textFieldController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(SFLStrings.message.kRegisterCrashReport),
        content: TextField(
          controller: textFieldController,
          maxLines: 4,
          minLines: 2,
          decoration: InputDecoration(
            hintText: SFLStrings.message.kHelpUsUnderstandError,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(SFLStrings.button.kCancel),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
          ),
          TextButton(
            child: Text(SFLStrings.button.kSend),
            onPressed: () async {
              await FirebaseCrashlytics.instance.recordError(
                exception,
                stackTrace,
                reason: textFieldController.text.isEmpty
                    ? SFLStrings.message.kNoInputFromUser
                    : textFieldController.text,
                printDetails: true,
              );
              Navigator.of(context).pop(true);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static void addLogOnFailure(Failure failure) {
    if (failure is UnknownException) {
      FirebaseUtil.recordErrorWithType(
          failure, StackTrace.current, ExceptionType.catchErrorException);
    } else if (failure is UnauthorisedException) {
      FirebaseUtil.recordErrorWithType(
          failure, StackTrace.current, ExceptionType.unauthorisedException);
    } else {
      FirebaseUtil.recordErrorWithType(
          failure, StackTrace.current, ExceptionType.serverException);
    }
    FirebaseUtil.addLog(failure.message);
  }
}
