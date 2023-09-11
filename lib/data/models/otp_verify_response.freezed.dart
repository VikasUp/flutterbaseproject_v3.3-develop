// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPVerifyResponse _$OTPVerifyResponseFromJson(Map<String, dynamic> json) {
  return _OTPVerifyResponse.fromJson(json);
}

/// @nodoc
mixin _$OTPVerifyResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  int? get httpStatus => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get applicationStatusCode => throw _privateConstructorUsedError;
  bool? get profileComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPVerifyResponseCopyWith<OTPVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPVerifyResponseCopyWith<$Res> {
  factory $OTPVerifyResponseCopyWith(
          OTPVerifyResponse value, $Res Function(OTPVerifyResponse) then) =
      _$OTPVerifyResponseCopyWithImpl<$Res, OTPVerifyResponse>;
  @useResult
  $Res call(
      {String? message,
      String? idToken,
      int? httpStatus,
      int? id,
      int? applicationStatusCode,
      bool? profileComplete});
}

/// @nodoc
class _$OTPVerifyResponseCopyWithImpl<$Res, $Val extends OTPVerifyResponse>
    implements $OTPVerifyResponseCopyWith<$Res> {
  _$OTPVerifyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? idToken = freezed,
    Object? httpStatus = freezed,
    Object? id = freezed,
    Object? applicationStatusCode = freezed,
    Object? profileComplete = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      profileComplete: freezed == profileComplete
          ? _value.profileComplete
          : profileComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OTPVerifyResponseCopyWith<$Res>
    implements $OTPVerifyResponseCopyWith<$Res> {
  factory _$$_OTPVerifyResponseCopyWith(_$_OTPVerifyResponse value,
          $Res Function(_$_OTPVerifyResponse) then) =
      __$$_OTPVerifyResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      String? idToken,
      int? httpStatus,
      int? id,
      int? applicationStatusCode,
      bool? profileComplete});
}

/// @nodoc
class __$$_OTPVerifyResponseCopyWithImpl<$Res>
    extends _$OTPVerifyResponseCopyWithImpl<$Res, _$_OTPVerifyResponse>
    implements _$$_OTPVerifyResponseCopyWith<$Res> {
  __$$_OTPVerifyResponseCopyWithImpl(
      _$_OTPVerifyResponse _value, $Res Function(_$_OTPVerifyResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? idToken = freezed,
    Object? httpStatus = freezed,
    Object? id = freezed,
    Object? applicationStatusCode = freezed,
    Object? profileComplete = freezed,
  }) {
    return _then(_$_OTPVerifyResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      profileComplete: freezed == profileComplete
          ? _value.profileComplete
          : profileComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTPVerifyResponse implements _OTPVerifyResponse {
  const _$_OTPVerifyResponse(
      {this.message,
      this.idToken,
      this.httpStatus,
      this.id,
      this.applicationStatusCode,
      this.profileComplete});

  factory _$_OTPVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OTPVerifyResponseFromJson(json);

  @override
  final String? message;
  @override
  final String? idToken;
  @override
  final int? httpStatus;
  @override
  final int? id;
  @override
  final int? applicationStatusCode;
  @override
  final bool? profileComplete;

  @override
  String toString() {
    return 'OTPVerifyResponse(message: $message, idToken: $idToken, httpStatus: $httpStatus, id: $id, applicationStatusCode: $applicationStatusCode, profileComplete: $profileComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OTPVerifyResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationStatusCode, applicationStatusCode) ||
                other.applicationStatusCode == applicationStatusCode) &&
            (identical(other.profileComplete, profileComplete) ||
                other.profileComplete == profileComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, idToken, httpStatus, id,
      applicationStatusCode, profileComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OTPVerifyResponseCopyWith<_$_OTPVerifyResponse> get copyWith =>
      __$$_OTPVerifyResponseCopyWithImpl<_$_OTPVerifyResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTPVerifyResponseToJson(
      this,
    );
  }
}

abstract class _OTPVerifyResponse implements OTPVerifyResponse {
  const factory _OTPVerifyResponse(
      {final String? message,
      final String? idToken,
      final int? httpStatus,
      final int? id,
      final int? applicationStatusCode,
      final bool? profileComplete}) = _$_OTPVerifyResponse;

  factory _OTPVerifyResponse.fromJson(Map<String, dynamic> json) =
      _$_OTPVerifyResponse.fromJson;

  @override
  String? get message;
  @override
  String? get idToken;
  @override
  int? get httpStatus;
  @override
  int? get id;
  @override
  int? get applicationStatusCode;
  @override
  bool? get profileComplete;
  @override
  @JsonKey(ignore: true)
  _$$_OTPVerifyResponseCopyWith<_$_OTPVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
