import 'package:base_project/core/util/extensions.dart';
import 'package:retrofit/dio.dart';

import '/core/error/error_index.dart';
import '/core/webservice/api_client.dart';
import '/data/models/index.dart';

abstract class OTPVerifyDatasource {
  Future<OTPVerifyResponse> otpVerify(
      String channel, String countryCode, String to, String otp);
}

class OTPVerifyDatasourceImpl implements OTPVerifyDatasource {
  @override
  Future<OTPVerifyResponse> otpVerify(
      String channel, String countryCode, String to, String otp) async {
    try {
      final otpValidationRequest = OTPVerifyRequest(
          channel: channel, countryDialCode: countryCode, to: to, otp: otp);
      HttpResponse<OTPVerifyResponse> response = await ApiClient
          .authenticateService
          .registerFinish(otpValidationRequest);
      if (response.isSuccessful) {
        return response.data;
      } else {
        throw ServerException();
      }
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }
}
