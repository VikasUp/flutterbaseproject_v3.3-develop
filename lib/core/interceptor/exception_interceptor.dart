import 'package:base_project/core/constant/error_message.dart';
import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:base_project/core/index.dart';
import 'package:base_project/core/interceptor/api_logger.dart';
import 'package:base_project/injection_container.dart';
import 'package:base_project/presentation/authentication/bloc/authentication.dart';
import 'package:dio/dio.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ApiLogger.addErrorLog(err);

    switch (err.type) {
      case DioErrorType.cancel:
        throw ServerException(ErrorMessage.requestCancelled);

      case DioErrorType.connectionTimeout:
        throw ServerException(ErrorMessage.requestTimeout);
      case DioErrorType.connectionError:
        throw ServerException(ErrorMessage.noInternetConnection);

      case DioErrorType.receiveTimeout:
        throw ServerException(ErrorMessage.noInternetConnection);
      case DioErrorType.badResponse:
        handleResponse(err);
        break;
      case DioErrorType.sendTimeout:
        throw ServerException(ErrorMessage.sendTimeout);
      case DioErrorType.badCertificate:
      case DioErrorType.unknown:
        throw ServerException(SFLStrings.message.kSomethingWentWrong);
    }
  }

  static void handleResponse(DioError err) {
    var response = err.response;
    switch (err.response?.statusCode) {
      case 200:
      case 201:
        FirebaseUtil.addFirebaseCrashLog(
            api: response?.realUri.path,
            code: response?.statusCode,
            content: "SUCCESS");
        break;
      case 400:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);

        FirebaseUtil.addFirebaseCrashLog(
            api: response?.realUri.path,
            code: exception.applicationStatusCode,
            content: exception.message);
        throw BadRequestException(
          exception.message,
          exception.applicationStatusCode,
        );

      case 401:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);

        if (exception.applicationStatusCode == 1001) {
          serviceLocator<AuthenticationBloc>()
              .add((const LoggedOut(isSessionExpire: true)));

          throw UnauthorisedException(
            SFLStrings.message.kSessionExpiredMessage,
            exception.applicationStatusCode,
          );
        } else {
          throw UnauthorisedException(
            exception.message,
            exception.applicationStatusCode,
          );
        }
      case 403:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);
        FirebaseUtil.addFirebaseCrashLog(
            api: response?.realUri.path,
            code: exception.applicationStatusCode,
            content: exception.message);
        throw UnauthorisedException(
          exception.message,
          exception.applicationStatusCode,
        );

      case 500:
      default:
        FirebaseUtil.addFirebaseCrashLog(
            api: response?.realUri.path,
            code: response?.statusCode,
            content: response?.statusMessage);
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response?.statusCode}');
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    ApiLogger.addResponseLog(response);
    super.onResponse(response, handler);
  }
}
