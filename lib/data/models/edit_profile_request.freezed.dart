// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) {
  return _EditProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$EditProfileRequest {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;
  CountryDialCode? get countryDialCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditProfileRequestCopyWith<EditProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileRequestCopyWith<$Res> {
  factory $EditProfileRequestCopyWith(
          EditProfileRequest value, $Res Function(EditProfileRequest) then) =
      _$EditProfileRequestCopyWithImpl<$Res, EditProfileRequest>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      int? phoneNumber,
      String? authToken,
      CountryDialCode? countryDialCode});

  $CountryDialCodeCopyWith<$Res>? get countryDialCode;
}

/// @nodoc
class _$EditProfileRequestCopyWithImpl<$Res, $Val extends EditProfileRequest>
    implements $EditProfileRequestCopyWith<$Res> {
  _$EditProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? authToken = freezed,
    Object? countryDialCode = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as CountryDialCode?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryDialCodeCopyWith<$Res>? get countryDialCode {
    if (_value.countryDialCode == null) {
      return null;
    }

    return $CountryDialCodeCopyWith<$Res>(_value.countryDialCode!, (value) {
      return _then(_value.copyWith(countryDialCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditProfileRequestCopyWith<$Res>
    implements $EditProfileRequestCopyWith<$Res> {
  factory _$$_EditProfileRequestCopyWith(_$_EditProfileRequest value,
          $Res Function(_$_EditProfileRequest) then) =
      __$$_EditProfileRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      int? phoneNumber,
      String? authToken,
      CountryDialCode? countryDialCode});

  @override
  $CountryDialCodeCopyWith<$Res>? get countryDialCode;
}

/// @nodoc
class __$$_EditProfileRequestCopyWithImpl<$Res>
    extends _$EditProfileRequestCopyWithImpl<$Res, _$_EditProfileRequest>
    implements _$$_EditProfileRequestCopyWith<$Res> {
  __$$_EditProfileRequestCopyWithImpl(
      _$_EditProfileRequest _value, $Res Function(_$_EditProfileRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? authToken = freezed,
    Object? countryDialCode = freezed,
  }) {
    return _then(_$_EditProfileRequest(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as CountryDialCode?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditProfileRequest implements _EditProfileRequest {
  const _$_EditProfileRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.authToken,
      this.countryDialCode});

  factory _$_EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EditProfileRequestFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final int? phoneNumber;
  @override
  final String? authToken;
  @override
  final CountryDialCode? countryDialCode;

  @override
  String toString() {
    return 'EditProfileRequest(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, authToken: $authToken, countryDialCode: $countryDialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileRequest &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      phoneNumber, authToken, countryDialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileRequestCopyWith<_$_EditProfileRequest> get copyWith =>
      __$$_EditProfileRequestCopyWithImpl<_$_EditProfileRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditProfileRequestToJson(
      this,
    );
  }
}

abstract class _EditProfileRequest implements EditProfileRequest {
  const factory _EditProfileRequest(
      {final String? firstName,
      final String? lastName,
      final String? email,
      final int? phoneNumber,
      final String? authToken,
      final CountryDialCode? countryDialCode}) = _$_EditProfileRequest;

  factory _EditProfileRequest.fromJson(Map<String, dynamic> json) =
      _$_EditProfileRequest.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  int? get phoneNumber;
  @override
  String? get authToken;
  @override
  CountryDialCode? get countryDialCode;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileRequestCopyWith<_$_EditProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
