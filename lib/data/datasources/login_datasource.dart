import 'package:base_project/data/models/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import '/core/index.dart';
import '/data/models/login_request.dart';

abstract class LoginDatasource {
  Future<String> loginUser(String username, String password);
}

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<String> loginUser(String username, String password) async {
    try {
      final loginRequest = LoginRequest(
          username: username, password: password, rememberMe: true);

      HttpResponse<LoginResponse> response =
          await ApiClient.authenticateService.authenticateUser(loginRequest);
      final objLogin = response.data;
      if ((objLogin.idToken ?? '').isNotEmpty) {
        return objLogin.idToken!;
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
