import 'dart:convert';

import 'package:base_project/core/constant/sfl_apis.dart';
import 'package:base_project/core/index.dart';
import 'package:base_project/core/interceptor/api_logger.dart';
import 'package:base_project/core/sharepref_helper.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  static const String authHeader = "Authorization";
  static const String bearer = "Bearer ";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;
    if (options.path == SFLAPIs.editProfile) {
      final body = options.data;
      Map<String, dynamic> jsonMap = json.decode(body);
      String authToken = jsonMap['authToken'] ?? '';

      if (authToken.isNotEmpty) {
        token = authToken;
      } else {
        token = await (SharedPreferenceHelper.getToken());
      }
    } else {
      token = await (SharedPreferenceHelper.getToken());
    }
    if (token != null && token.isNotEmpty) {
      options.headers = {
        authHeader: bearer + token,
        "Content-Type": "application/json",
      };
    }

    ApiLogger.addRequestLog(options);
    super.onRequest(options, handler);
  }
}
