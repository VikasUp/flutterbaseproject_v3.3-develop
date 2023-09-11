
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_model.g.dart';

part 'country_code_model.freezed.dart';

@Freezed()
class CountryCodeModel with _$CountryCodeModel {
  const factory CountryCodeModel({
    required int id,
    required String name,
    required String countryCode,
  }) = _CountryCodeModel;

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeModelFromJson(json);
}
