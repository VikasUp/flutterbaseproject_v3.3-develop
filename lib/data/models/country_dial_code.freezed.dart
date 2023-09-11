// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_dial_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryDialCode _$CountryDialCodeFromJson(Map<String, dynamic> json) {
  return _CountryDialCode.fromJson(json);
}

/// @nodoc
mixin _$CountryDialCode {
  String? get dialCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryDialCodeCopyWith<CountryDialCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDialCodeCopyWith<$Res> {
  factory $CountryDialCodeCopyWith(
          CountryDialCode value, $Res Function(CountryDialCode) then) =
      _$CountryDialCodeCopyWithImpl<$Res, CountryDialCode>;
  @useResult
  $Res call({String? dialCode});
}

/// @nodoc
class _$CountryDialCodeCopyWithImpl<$Res, $Val extends CountryDialCode>
    implements $CountryDialCodeCopyWith<$Res> {
  _$CountryDialCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dialCode = freezed,
  }) {
    return _then(_value.copyWith(
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryDialCodeCopyWith<$Res>
    implements $CountryDialCodeCopyWith<$Res> {
  factory _$$_CountryDialCodeCopyWith(
          _$_CountryDialCode value, $Res Function(_$_CountryDialCode) then) =
      __$$_CountryDialCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? dialCode});
}

/// @nodoc
class __$$_CountryDialCodeCopyWithImpl<$Res>
    extends _$CountryDialCodeCopyWithImpl<$Res, _$_CountryDialCode>
    implements _$$_CountryDialCodeCopyWith<$Res> {
  __$$_CountryDialCodeCopyWithImpl(
      _$_CountryDialCode _value, $Res Function(_$_CountryDialCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dialCode = freezed,
  }) {
    return _then(_$_CountryDialCode(
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryDialCode implements _CountryDialCode {
  const _$_CountryDialCode({this.dialCode});

  factory _$_CountryDialCode.fromJson(Map<String, dynamic> json) =>
      _$$_CountryDialCodeFromJson(json);

  @override
  final String? dialCode;

  @override
  String toString() {
    return 'CountryDialCode(dialCode: $dialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryDialCode &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryDialCodeCopyWith<_$_CountryDialCode> get copyWith =>
      __$$_CountryDialCodeCopyWithImpl<_$_CountryDialCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryDialCodeToJson(
      this,
    );
  }
}

abstract class _CountryDialCode implements CountryDialCode {
  const factory _CountryDialCode({final String? dialCode}) = _$_CountryDialCode;

  factory _CountryDialCode.fromJson(Map<String, dynamic> json) =
      _$_CountryDialCode.fromJson;

  @override
  String? get dialCode;
  @override
  @JsonKey(ignore: true)
  _$$_CountryDialCodeCopyWith<_$_CountryDialCode> get copyWith =>
      throw _privateConstructorUsedError;
}
