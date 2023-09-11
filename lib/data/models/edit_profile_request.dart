import 'package:base_project/data/models/country_dial_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_request.g.dart';

part 'edit_profile_request.freezed.dart';

@Freezed()
class EditProfileRequest with _$EditProfileRequest {
  const factory EditProfileRequest({
    String? firstName,
    String? lastName,
    String? email,
    int? phoneNumber,
    String? authToken,
    CountryDialCode? countryDialCode,
  }) = _EditProfileRequest;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);
}
