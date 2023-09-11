import 'package:base_project/core/error/exception.dart';
import 'package:base_project/core/util/extensions.dart';
import 'package:base_project/core/webservice/api_client.dart';
import 'package:base_project/data/models/country_code_model.dart';
import 'package:base_project/data/models/otp_sent_model.dart';
import 'package:base_project/data/models/send_otp_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';



abstract class RegisterWithOTPDatasource {
  Future<List<CountryCodeModel>> getCountryCode();
  Future<OtpSentModel> sendOTP(
      {required String channel, required String to, String? countryCode});
}

class RegisterWithOTPDatasourceImpl implements RegisterWithOTPDatasource {
  @override
  Future<List<CountryCodeModel>> getCountryCode() async {
    try {
      HttpResponse<List<CountryCodeModel>> response =
          await ApiClient.authenticateService.getCountryCodes();
      if (response.isSuccessful) {
        return response.data.toList();
      } else {
        throw ServerException();
      }
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }

  @override
  Future<OtpSentModel> sendOTP(
      {required String channel,
      required String to,
      String? countryCode}) async {
    try {
      

      final sendOTPRequest =  SendOTPRequest(channel: channel, to: to,countryDialCode: countryCode);

      final HttpResponse<OtpSentModel> response =
          await ApiClient.authenticateService.registerInit(sendOTPRequest);

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
