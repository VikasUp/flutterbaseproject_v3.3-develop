import 'package:base_project/core/index.dart';
import 'package:dio/dio.dart';

class ApiLogger {
  static void addRequestLog(RequestOptions options) {
    log.info('******* Request *********');
    printLog('URL: ', options.uri);
    printLog('method', options.method);
    printLog('extra', options.extra);
    log.info('Headers : ');
    options.headers.forEach((key, v) {
      printLog(' $key :', v);
    });
    printLog('data:', options.data);
    printLog('responseType', options.responseType.toString());
    printLog('followRedirects', options.followRedirects);
    printLog('connectTimeout', options.connectTimeout);
    printLog('sendTimeout', options.sendTimeout);
    printLog('receiveTimeout', options.receiveTimeout);
    printLog('receiveDataWhenStatusError', options.receiveDataWhenStatusError);
  }

  static void addResponseLog(Response response, [bool isError = false]) {
    if (!isError) {
      log.info('******* Response ********');
    }

    printLog('uri', response.requestOptions.uri);
    printLog('statusCode', response.statusCode);
    if (response.isRedirect == true) {
      printLog('redirect', response.realUri);
    }
    log.info('Headers : ');
    response.headers.forEach((key, v) => printLog(' $key', v.join('\r\n\t')));
    printLog('Response Text:', response.toString());
  }

  static void addErrorLog(DioError err) {
    log.info('******** DioError *******');
    printLog('uri:', err.requestOptions.uri);
    printLog('Error Type :', err.type);
    log.info(err);
    if (err.response != null) {
      addResponseLog(err.response!,true);
    }
  }

  static void printLog(String key, dynamic value) {
    log.info('$key : $value');
  }
}
