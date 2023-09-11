export 'package:base_project/core/constant/enums.dart' show ExceptionType;
 
import 'package:base_project/core/constant/enums.dart' show ExceptionType;
import 'package:base_project/core/util/utilities.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseUtil {
  static void addLog(String log) {
    FirebaseCrashlytics.instance.log(log);
  }

  static void addFirebaseCrashLog({String? api, int? code, String? content}) {
    FirebaseCrashlytics.instance.log("$api\t$code\t $content");
  }

  static void recordErrorWithType(
      dynamic exception, StackTrace stackTrace, ExceptionType exceptionType) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace,
        reason: Utilities.enumToString(exceptionType));
  }
}
