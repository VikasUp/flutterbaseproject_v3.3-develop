import 'package:base_project/data/datasources/breakers_datasource.dart';
import 'package:base_project/data/repositories/breakers_repository.dart';
import 'package:base_project/domain/usecases/divison_list.dart';
import 'package:base_project/domain/usecases/fetch_user_listing.dart';
import 'package:base_project/domain/usecases/team_list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/datasources/edit_profile_datasource.dart';
import '/data/datasources/local_datasource.dart';
import '/data/datasources/register_with_otp_datasource.dart';
import '/domain/usecases/clear_token.dart';
import '/domain/usecases/get_token.dart';
import '/domain/usecases/otp_verify.dart';
import '/domain/usecases/send_otp.dart';
import '/domain/usecases/store_token.dart';
import '/domain/usecases/update_profile.dart';
import '/data/datasources/forgot_password_datasource.dart';
import '/domain/usecases/forgot_password.dart';
import '/data/datasources/home_datasource.dart';
import '/domain/usecases/get_user.dart';
import '/data/datasources/login_datasource.dart';
import '/domain/usecases/login_user.dart';
import '/data/datasources/otp_verify_datasource.dart';
import '/domain/usecases/get_country_code.dart';
import '/data/datasources/registration_datasource.dart';
import '/domain/usecases/user_register.dart';
import '/presentation/authentication/bloc/authentication.dart';
import '/presentation/edit_profile/bloc/edit_profile_bloc.dart';
import '/presentation/forgot_password/bloc/forgot_password.dart';
import '/presentation/home/bloc/home.dart';
import '/presentation/login/bloc/login.dart';
import '/presentation/otp_validation/bloc/otp_validation_bloc.dart';
import '/presentation/register_with_otp/bloc/register_with_otp_bloc.dart';
import '/presentation/registration/bloc/registration_bloc.dart';
import 'core/firebase/index.dart';
import 'data/repositories/index.dart';
import 'presentation/breakers_paradise/bloc/breakers_bloc.dart';
import 'presentation/profile/bloc/profile.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Feature - navigation for force logout
  serviceLocator.registerLazySingleton(() => AppNavigator());

  //! Feature - Firebase Analytics Service
  serviceLocator.registerLazySingleton(() => FirebaseAnalyticsService());

  //! Features - Login
  serviceLocator.registerFactory(() => LoginBloc(
      authenticationBloc: serviceLocator(), loginUser: serviceLocator()));
  serviceLocator.registerFactory(() => LoginUser(serviceLocator()));
  serviceLocator.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<LoginDatasource>(() => LoginDatasourceImpl());

  //! Features - Authentication
  serviceLocator.registerLazySingleton(() => AuthenticationBloc(
      storeToken: serviceLocator(),
      getToken: serviceLocator(),
      clearToken: serviceLocator()));
  serviceLocator.registerFactory(() => StoreToken(serviceLocator()));
  serviceLocator.registerFactory(() => GetToken(serviceLocator()));
  serviceLocator.registerFactory(() => ClearToken(serviceLocator()));
  serviceLocator.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<AuthenticationDataSource>(
      () => AuthenticationDataSourceImpl(sharedPreferences: serviceLocator()));

  serviceLocator.registerFactory(() => RegistrationBloc(serviceLocator()));
  serviceLocator.registerFactory(() => UserRegister(serviceLocator()));
  serviceLocator.registerFactory<RegistrationRepository>(
      () => RegistrationRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<RegistrationDatasource>(
      () => RegistrationDatasourceImpl());

  //! Features - Forgot Password
  serviceLocator.registerFactory(() => ForgotPasswordBloc(
      authenticationBloc: serviceLocator(), forgotPassword: serviceLocator()));
  serviceLocator.registerFactory(() => ForgotPassword(serviceLocator()));
  serviceLocator.registerFactory<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<ForgotPasswordDatasource>(
      () => ForgotPasswordDatasourceImpl());

  //! Features - Home - Passed from HomePage manually
  serviceLocator.registerFactory(() => HomeBloc(
      authenticationBloc: serviceLocator(), getUser: serviceLocator()));
  serviceLocator.registerFactory(() => GetUser(serviceLocator()));
  serviceLocator.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<HomeDataSource>(() => HomeDataSourceImpl());

  //! Features - Profile
  serviceLocator
      .registerFactory(() => ProfileBloc(fetchUserListing: serviceLocator()));
  serviceLocator.registerFactory(() => FetchUserListing(serviceLocator()));

  //! Features - OTP Validation
  serviceLocator.registerFactory(
      () => OtpValidationBloc(serviceLocator(), serviceLocator()));
  serviceLocator.registerFactory(() => OTPVerify(serviceLocator()));
  serviceLocator.registerFactory<OTPVerifyRepository>(
      () => OTPVerifyRepositoryImpl(serviceLocator()));
  serviceLocator
      .registerFactory<OTPVerifyDatasource>(() => OTPVerifyDatasourceImpl());

  //! Features - OTP Validation
  serviceLocator.registerFactory(
      () => RegisterWithOTPBloc(serviceLocator(), serviceLocator()));
  serviceLocator.registerFactory(() => SendOTP(serviceLocator()));
  serviceLocator.registerFactory(() => GetCountryCode(serviceLocator()));
  serviceLocator.registerFactory<RegisterWithOTPRepository>(
      () => RegisterWithOTPRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<RegisterWithOTPDatasource>(
      () => RegisterWithOTPDatasourceImpl());

  //! Features - Edit Profile
  serviceLocator.registerFactory(() => EditProfileBloc(serviceLocator()));
  serviceLocator.registerFactory(() => UpdateProfile(serviceLocator()));
  serviceLocator.registerFactory<EditProfileRepository>(
      () => EditProfileRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<EditProfileDatasource>(
      () => EditProfileDatasourceImpl());

  //! Breakers

  serviceLocator.registerFactory(() => BreakersBloc(
      datasource: serviceLocator(),
      divisionList: serviceLocator(),
      teamslistContent: serviceLocator()));
  serviceLocator.registerFactory(() => Teams(serviceLocator()));
  serviceLocator.registerFactory(() => Division(serviceLocator()));
  serviceLocator.registerFactory<BreakersRepository>(
      () => BreakersRepositoryImpl(serviceLocator()));
  serviceLocator
      .registerFactory<BreakersDatasource>(() => BreakersDatasourceImpl());

  //! Core
  //! External

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => preferences);

  // Register Firebase
  serviceLocator.registerLazySingleton(
      () => FirebaseAnalyticsObserver(analytics: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FirebaseAnalytics.instance);
}
