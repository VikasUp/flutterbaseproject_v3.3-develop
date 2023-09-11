// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPVerifyRequest _$OTPVerifyRequestFromJson(Map<String, dynamic> json) {
  return _OTPVerifyRequest.fromJson(json);
}

/// @nodoc
mixin _$OTPVerifyRequest {
  String? get channel => throw _privateConstructorUsedError;
  String? get countryDialCode => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPVerifyRequestCopyWith<OTPVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPVerifyRequestCopyWith<$Res> {
  factory $OTPVerifyRequestCopyWith(
          OTPVerifyRequest value, $Res Function(OTPVerifyRequest) then) =
      _$OTPVerifyRequestCopyWithImpl<$Res, OTPVerifyRequest>;
  @useResult
  $Res call(
      {String? channel, String? countryDialCode, String? to, String? otp});
}

/// @nodoc
class _$OTPVerifyRequestCopyWithImpl<$Res, $Val extends OTPVerifyRequest>
    implements $OTPVerifyRequestCopyWith<$Res> {
  _$OTPVerifyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? countryDialCode = freezed,
    Object? to = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OTPVerifyRequestCopyWith<$Res>
    implements $OTPVerifyRequestCopyWith<$Res> {
  factory _$$_OTPVerifyRequestCopyWith(
          _$_OTPVerifyRequest value, $Res Function(_$_OTPVerifyRequest) then) =
      __$$_OTPVerifyRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? channel, String? countryDialCode, String? to, String? otp});
}

/// @nodoc
class __$$_OTPVerifyRequestCopyWithImpl<$Res>
    extends _$OTPVerifyRequestCopyWithImpl<$Res, _$_OTPVerifyRequest>
    implements _$$_OTPVerifyRequestCopyWith<$Res> {
  __$$_OTPVerifyRequestCopyWithImpl(
      _$_OTPVerifyRequest _value, $Res Function(_$_OTPVerifyRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? countryDialCode = freezed,
    Object? to = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$_OTPVerifyRequest(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTPVerifyRequest implements _OTPVerifyRequest {
  const _$_OTPVerifyRequest(
      {this.channel, this.countryDialCode, this.to, this.otp});

  factory _$_OTPVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OTPVerifyRequestFromJson(json);

  @override
  final String? channel;
  @override
  final String? countryDialCode;
  @override
  final String? to;
  @override
  final String? otp;

  @override
  String toString() {
    return 'OTPVerifyRequest(channel: $channel, countryDialCode: $countryDialCode, to: $to, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OTPVerifyRequest &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, countryDialCode, to, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OTPVerifyRequestCopyWith<_$_OTPVerifyRequest> get copyWith =>
      __$$_OTPVerifyRequestCopyWithImpl<_$_OTPVerifyRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTPVerifyRequestToJson(
      this,
    );
  }
}

abstract class _OTPVerifyRequest implements OTPVerifyRequest {
  const factory _OTPVerifyRequest(
      {final String? channel,
      final String? countryDialCode,
      final String? to,
      final String? otp}) = _$_OTPVerifyRequest;

  factory _OTPVerifyRequest.fromJson(Map<String, dynamic> json) =
      _$_OTPVerifyRequest.fromJson;

  @override
  String? get channel;
  @override
  String? get countryDialCode;
  @override
  String? get to;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_OTPVerifyRequestCopyWith<_$_OTPVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
