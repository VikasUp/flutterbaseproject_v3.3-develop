// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_modal.g.dart';

// part 'user_model.freezed.dart';

// @freezed
// class UserModel with _$UserModel {
//   factory UserModel({
//     int? id,
//     String? firstName,
//     String? lastName,
//     String? maidenName,
//     int? age,
//     String? gender,
//     String? email,
//     String? phone,
//     String? username,
//     String? password,
//     @JsonKey(name: 'birthDate') String? birthDate,
//     String? image,
//     @JsonKey(name: 'bloodGroup') String? bloodGroup,
//     double? height,
//     double? weight,
//     String? eyeColor,
//     String? hair,
//     String? domain,
//     String? ip,
//     Address? address,
//     @JsonKey(name: 'macAddress') String? macAddress,
//     String? university,
//     Bank? bank,
//     Company? company,
//     String? ein,
//     String? ssn,
//     @JsonKey(name: 'userAgent') String? userAgent,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);
// }

// @freezed
// class Hair with _$Hair {
//   factory Hair({
//     String? color,
//     String? type,
//   }) = _Hair;
// }

// @freezed
// class Address with _$Address {
//   factory Address({
//     String? address,
//     String? city,
//     Coordinates? coordinates,
//     @JsonKey(name: 'postalCode') String? postalCode,
//     String? state,
//   }) = _Address;
// }

// @freezed
// class Coordinates with _$Coordinates {
//   factory Coordinates({
//     double? lat,
//     double? lng,
//   }) = _Coordinates;
// }

// @freezed
// class Bank with _$Bank {
//   factory Bank({
//     @JsonKey(name: 'cardExpire') String? cardExpire,
//     @JsonKey(name: 'cardNumber') String? cardNumber,
//     @JsonKey(name: 'cardType') String? cardType,
//     String? currency,
//     String? iban,
//   }) = _Bank;
// }

// @freezed
// class Company with _$Company {
//   factory Company({
//     Address? address,
//     String? department,
//     String? name,
//     String? title,
//   }) = _Company;
// }
