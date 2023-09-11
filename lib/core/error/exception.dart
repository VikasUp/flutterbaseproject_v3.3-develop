import 'package:base_project/core/constant/strings.dart';
import 'package:dio/dio.dart';

class Failure extends DioError {
  final String? errorMessage;

  final int? applicationStatusCode;

  @override
  String get message => errorMessage ?? '';

  Failure({
    this.applicationStatusCode,
    this.errorMessage,
  }) : super(requestOptions: RequestOptions(path: ''));

  @override
  String toString() {
    if (message.isNotEmpty) {
      return message;
    } else {
      return SFLStrings.message.kSomethingWentWrong;
    }
  }
}

class ServerException extends Failure {
  ServerException([message, applicationStatusCode])
      : super(
          errorMessage: message,
          applicationStatusCode: applicationStatusCode,
        );
}

class CacheException extends Failure {
  CacheException() : super();
}

class FetchDataException extends Failure {
  FetchDataException([message]) : super(errorMessage: message);
}

class BadRequestException extends Failure {
  BadRequestException([message, applicationStatusCode])
      : super(
            errorMessage: message,
            applicationStatusCode: applicationStatusCode);
}

class UnauthorisedException extends Failure {
  UnauthorisedException([message, applicationStatusCode])
      : super(
            errorMessage: message,
            applicationStatusCode: applicationStatusCode);
}

class NoNetworkException extends Failure {
  NoNetworkException([requestOptions])
      : super(
          errorMessage: SFLStrings.message.kNoInternet,
        );
}

class UnknownException extends Failure {
  final String? errMessage;
  UnknownException([this.errMessage]) : super(errorMessage: errMessage);

  @override
  String toString() {
    if ((errMessage ?? '').isNotEmpty) {
      return message;
    } else {
      return SFLStrings.message.kSomethingWentWrong;
    }
  }
}
