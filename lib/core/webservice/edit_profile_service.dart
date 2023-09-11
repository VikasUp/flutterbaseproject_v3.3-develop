

import 'package:base_project/core/constant/sfl_apis.dart';
import 'package:base_project/data/models/edit_profile_request.dart';
import 'package:base_project/data/models/edit_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'edit_profile_service.g.dart';

@RestApi(baseUrl: '')
abstract class EditProfileService {
  factory EditProfileService(Dio dio, {String baseUrl}) = _EditProfileService;

  @PUT(SFLAPIs.editProfile)
  Future<HttpResponse<EditProfileResponse>> editProfile(
    @Body() EditProfileRequest request,
  );
}
