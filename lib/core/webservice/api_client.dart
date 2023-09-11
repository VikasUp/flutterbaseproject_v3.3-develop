import 'package:base_project/core/index.dart';
import 'package:base_project/core/webservice/authenticate_service.dart';
import 'package:base_project/core/webservice/breakers_service.dart';
import 'package:base_project/core/webservice/edit_profile_service.dart';
import 'package:base_project/core/webservice/mock_adapter.dart';
import 'package:base_project/core/webservice/user_list_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final AuthenticateService authenticateService;
  static late final UserListService userListService;
  static late final EditProfileService editProfileService;
  static late final BreakersService breakersService;

  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(baseUrl: AppConfig.getInstance().apiBaseUrl)
      ..httpClientAdapter = MockAdapter();
    dio.interceptors.addAll([
      NetworkInterceptor(),
      ExceptionInterceptor(),
      HeaderInterceptor(),
    ]);

    authenticateService = AuthenticateService(dio);
    userListService = UserListService(dio);
    editProfileService = EditProfileService(dio);
    breakersService = BreakersService(dio);
  }

  static void logPrint(Object object) {
    log.info(object);
  }
}
