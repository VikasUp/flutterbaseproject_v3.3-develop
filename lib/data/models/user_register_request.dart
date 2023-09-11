import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_request.g.dart';

part 'user_register_request.freezed.dart';

@Freezed()
class UserRegisterRequest with _$UserRegisterRequest {
  const factory UserRegisterRequest({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required bool status,
    int? phoneNumber,
  }) = _UserRegisterRequest;

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);
}
