import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:base_project/core/index.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final isInternetAvailable = NetworkInfo().isConnected;
    final isMockFlavour = (AppConfig.getInstance().flavor == Environment.mock);

    if (!isInternetAvailable && !isMockFlavour) {
      throw NoConnectivityException();
    } else {
      FirebaseUtil.addLog("Requested: ${options.path}");
    }
    super.onRequest(options, handler);
  }
}

class NoConnectivityException extends ServerException {
  @override
  String toString() => SFLStrings.message.kNoInternet;
}
