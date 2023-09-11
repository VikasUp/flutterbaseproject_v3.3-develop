import 'package:base_project/core/constant/sfl_apis.dart';
import 'package:base_project/data/models/index.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'authenticate_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthenticateService {
  factory AuthenticateService(Dio dio, {String baseUrl}) = _AuthenticateService;

  @POST(SFLAPIs.authenticate)
  Future<HttpResponse<LoginResponse>> authenticateUser(@Body() LoginRequest request);

  @POST(SFLAPIs.forgetPassword)
  Future<HttpResponse> callForgotPassword(@Body() ForgotPasswordRequest request);

  @POST(SFLAPIs.register)
  Future<HttpResponse> registerUser(@Body() UserRegisterRequest request);

  @POST(SFLAPIs.registerInit)
  Future<HttpResponse<OtpSentModel>> registerInit(@Body() SendOTPRequest request);

  @POST(SFLAPIs.registerFinish)
  Future<HttpResponse<OTPVerifyResponse>> registerFinish(@Body() OTPVerifyRequest request);

  @GET(SFLAPIs.getCountryCodes)
  Future<HttpResponse<List<CountryCodeModel>>> getCountryCodes();
}
