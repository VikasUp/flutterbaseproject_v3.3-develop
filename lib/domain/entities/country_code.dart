import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_code.g.dart';

@JsonSerializable()
class CountryCode extends Equatable {
  final int id;
  final String name;
  final String countryCode;

  const CountryCode(this.id, this.name, this.countryCode);

  factory CountryCode.fromJson(Map<String, dynamic> data) =>
      _$CountryCodeFromJson(data);

  Map<String, dynamic> toJson() => _$CountryCodeToJson(this);

  @override
  List<Object?> get props => [id, name, countryCode];
}
