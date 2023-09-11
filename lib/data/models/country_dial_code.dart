import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_dial_code.g.dart';

part 'country_dial_code.freezed.dart';

@Freezed()
class CountryDialCode with _$CountryDialCode {
  const factory CountryDialCode({
    String? dialCode,
  }) = _CountryDialCode;

  factory CountryDialCode.fromJson(Map<String, dynamic> json) =>
      _$CountryDialCodeFromJson(json);
}
