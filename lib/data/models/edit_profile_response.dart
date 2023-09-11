import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_response.g.dart';

part 'edit_profile_response.freezed.dart';

@Freezed()
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
    String? message,
    int? httpStatus,
    String? idToken,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
}
