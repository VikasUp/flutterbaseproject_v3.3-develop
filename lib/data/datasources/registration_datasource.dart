import 'package:retrofit/dio.dart';
import '/core/error/error_index.dart';
import '/core/webservice/api_client.dart';
import '/data/models/user_register_request.dart';
import '/core/util/extensions.dart';

abstract class RegistrationDatasource {
  Future<bool> userRegister(String email, String password, String firstName,
      String lastName, String username, int? phoneNumber);
}

class RegistrationDatasourceImpl implements RegistrationDatasource {
  @override
  Future<bool> userRegister(String email, String password, String firstName,
      String lastName, String username, int? phoneNumber) async {
    try {
      final registerRequest = UserRegisterRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          userName: username,
          status: true);

      HttpResponse response =
          await ApiClient.authenticateService.registerUser(registerRequest);
      return response.isSuccessful;
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
