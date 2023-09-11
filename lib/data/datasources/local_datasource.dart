
import 'package:shared_preferences/shared_preferences.dart';

import '/core/index.dart';
import '/core/sharepref_helper.dart';

const String kToken = "token";

abstract class AuthenticationDataSource {
  Future<bool> clearToken();
  Future<String?> getToken();
  Future<bool> storeToken(String token);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final SharedPreferences sharedPreferences;

  AuthenticationDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> clearToken() async{
    await sharedPreferences.clear();
    return true;
  }

  @override
  Future<String?> getToken() async{
    String? token = sharedPreferences.getString(kToken);
    return token;
  }

  @override
  Future<bool> storeToken(String token) async{
    await SharedPreferenceHelper.setToken(token);
    return true;
  }

}