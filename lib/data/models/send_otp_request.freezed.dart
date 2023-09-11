// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendOTPRequest _$SendOTPRequestFromJson(Map<String, dynamic> json) {
  return _SendOTPRequest.fromJson(json);
}

/// @nodoc
mixin _$SendOTPRequest {
  String get channel => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String? get countryDialCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendOTPRequestCopyWith<SendOTPRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOTPRequestCopyWith<$Res> {
  factory $SendOTPRequestCopyWith(
          SendOTPRequest value, $Res Function(SendOTPRequest) then) =
      _$SendOTPRequestCopyWithImpl<$Res, SendOTPRequest>;
  @useResult
  $Res call({String channel, String to, String? countryDialCode});
}

/// @nodoc
class _$SendOTPRequestCopyWithImpl<$Res, $Val extends SendOTPRequest>
    implements $SendOTPRequestCopyWith<$Res> {
  _$SendOTPRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? to = null,
    Object? countryDialCode = freezed,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendOTPRequestCopyWith<$Res>
    implements $SendOTPRequestCopyWith<$Res> {
  factory _$$_SendOTPRequestCopyWith(
          _$_SendOTPRequest value, $Res Function(_$_SendOTPRequest) then) =
      __$$_SendOTPRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channel, String to, String? countryDialCode});
}

/// @nodoc
class __$$_SendOTPRequestCopyWithImpl<$Res>
    extends _$SendOTPRequestCopyWithImpl<$Res, _$_SendOTPRequest>
    implements _$$_SendOTPRequestCopyWith<$Res> {
  __$$_SendOTPRequestCopyWithImpl(
      _$_SendOTPRequest _value, $Res Function(_$_SendOTPRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? to = null,
    Object? countryDialCode = freezed,
  }) {
    return _then(_$_SendOTPRequest(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendOTPRequest implements _SendOTPRequest {
  const _$_SendOTPRequest(
      {required this.channel, required this.to, this.countryDialCode});

  factory _$_SendOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SendOTPRequestFromJson(json);

  @override
  final String channel;
  @override
  final String to;
  @override
  final String? countryDialCode;

  @override
  String toString() {
    return 'SendOTPRequest(channel: $channel, to: $to, countryDialCode: $countryDialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendOTPRequest &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel, to, countryDialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendOTPRequestCopyWith<_$_SendOTPRequest> get copyWith =>
      __$$_SendOTPRequestCopyWithImpl<_$_SendOTPRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendOTPRequestToJson(
      this,
    );
  }
}

abstract class _SendOTPRequest implements SendOTPRequest {
  const factory _SendOTPRequest(
      {required final String channel,
      required final String to,
      final String? countryDialCode}) = _$_SendOTPRequest;

  factory _SendOTPRequest.fromJson(Map<String, dynamic> json) =
      _$_SendOTPRequest.fromJson;

  @override
  String get channel;
  @override
  String get to;
  @override
  String? get countryDialCode;
  @override
  @JsonKey(ignore: true)
  _$$_SendOTPRequestCopyWith<_$_SendOTPRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
