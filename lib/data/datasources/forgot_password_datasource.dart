import 'package:base_project/core/error/exception.dart';
import 'package:base_project/core/util/extensions.dart';
import 'package:base_project/core/webservice/api_client.dart';
import 'package:base_project/data/models/forgot_password_request.dart';



abstract class ForgotPasswordDatasource {
  Future<bool> forgotPassword(String email);
}

class ForgotPasswordDatasourceImpl implements ForgotPasswordDatasource {
  @override
  Future<bool> forgotPassword(String email) async {
    try {
      final fpRequest = ForgotPasswordRequest(email: email);
      final response =
          await ApiClient.authenticateService.callForgotPassword(fpRequest);
      if (response.isSuccessful) {
        return true;
      } else {
        return false;
      }
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
