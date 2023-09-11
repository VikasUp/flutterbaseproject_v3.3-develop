import 'dart:typed_data';

import 'package:base_project/core/constant/sfl_apis.dart';
import 'package:base_project/core/index.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class MockAdapter extends IOHttpClientAdapter {
  final IOHttpClientAdapter _adapter = IOHttpClientAdapter();

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    String url = options.uri.path;
    final isMockFlavour = (AppConfig.getInstance().flavor == Environment.mock);

    if (isMockFlavour) {
      if (url == SFLAPIs.authenticate) {
        return await _convertToResponseBody(SFLAPIs.mock.kLogin);
      } else if (url == SFLAPIs.forgetPassword) {
        return _convertToResponseBody();
      } else if (url == SFLAPIs.profile) {
        return await _convertToResponseBody(SFLAPIs.mock.kProfile);
      } else if (url.contains(SFLAPIs.userListing.split("?").first)) {
        return await _convertToResponseBody(SFLAPIs.mock.kUserList);
      } else if (url == SFLAPIs.getCountryCodes) {
        return await _convertToResponseBody(SFLAPIs.mock.kCountryCode);
      } else if (url == SFLAPIs.registerInit) {
        return await _convertToResponseBody(SFLAPIs.mock.kRegisterInit);
      } else if (url == SFLAPIs.registerFinish) {
        return await _convertToResponseBody(SFLAPIs.mock.kRegisterFinish);
      } else if (url == SFLAPIs.editProfile) {
        return await _convertToResponseBody(SFLAPIs.mock.kUpdateProfile);
      } else if (url == SFLAPIs.divisionResponse) {
        return await _convertToResponseBody(SFLAPIs.mock.kDivisonResponse);
      } else if (url == SFLAPIs.teamResponse) {
        return await _convertToResponseBody(SFLAPIs.mock.kTeamResponse);
      } else if (url == SFLAPIs.saveResponse) {
        return await _convertToResponseBody(SFLAPIs.mock.kSaveResponse);
      }else if (url == SFLAPIs.usermodelResponse) {
        return await _convertToResponseBody(SFLAPIs.mock.kUserModelRespose);
      }
      else {
        return _adapter.fetch(options, requestStream, cancelFuture);
      }
    } else {
      return _adapter.fetch(options, requestStream, cancelFuture);
    }
  }

  Future<ResponseBody> _convertToResponseBody([String? assetUrl]) async {
    //! This method will create the response
    //! Don't forget to pass the json type in header, otherwise will throw the error
    var headers = {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    };
    String responseStr = '';
    if (assetUrl != null) {
      responseStr = await Utilities.parseStringFromAssets(assetUrl);
    }
    return ResponseBody.fromString(responseStr, 200, headers: headers);
  }

  @override
  void close({bool force = false}) {}
}
