// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseFailure _$ResponseFailureFromJson(Map<String, dynamic> json) {
  return _ResponseFailure.fromJson(json);
}

/// @nodoc
mixin _$ResponseFailure {
  String? get message => throw _privateConstructorUsedError;
  int? get applicationStatusCode => throw _privateConstructorUsedError;
  int? get httpStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseFailureCopyWith<ResponseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseFailureCopyWith<$Res> {
  factory $ResponseFailureCopyWith(
          ResponseFailure value, $Res Function(ResponseFailure) then) =
      _$ResponseFailureCopyWithImpl<$Res, ResponseFailure>;
  @useResult
  $Res call({String? message, int? applicationStatusCode, int? httpStatus});
}

/// @nodoc
class _$ResponseFailureCopyWithImpl<$Res, $Val extends ResponseFailure>
    implements $ResponseFailureCopyWith<$Res> {
  _$ResponseFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? applicationStatusCode = freezed,
    Object? httpStatus = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseFailureCopyWith<$Res>
    implements $ResponseFailureCopyWith<$Res> {
  factory _$$_ResponseFailureCopyWith(
          _$_ResponseFailure value, $Res Function(_$_ResponseFailure) then) =
      __$$_ResponseFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? applicationStatusCode, int? httpStatus});
}

/// @nodoc
class __$$_ResponseFailureCopyWithImpl<$Res>
    extends _$ResponseFailureCopyWithImpl<$Res, _$_ResponseFailure>
    implements _$$_ResponseFailureCopyWith<$Res> {
  __$$_ResponseFailureCopyWithImpl(
      _$_ResponseFailure _value, $Res Function(_$_ResponseFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? applicationStatusCode = freezed,
    Object? httpStatus = freezed,
  }) {
    return _then(_$_ResponseFailure(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseFailure
    with DiagnosticableTreeMixin
    implements _ResponseFailure {
  const _$_ResponseFailure(
      {this.message, this.applicationStatusCode, this.httpStatus});

  factory _$_ResponseFailure.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseFailureFromJson(json);

  @override
  final String? message;
  @override
  final int? applicationStatusCode;
  @override
  final int? httpStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseFailure(message: $message, applicationStatusCode: $applicationStatusCode, httpStatus: $httpStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseFailure'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('applicationStatusCode', applicationStatusCode))
      ..add(DiagnosticsProperty('httpStatus', httpStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.applicationStatusCode, applicationStatusCode) ||
                other.applicationStatusCode == applicationStatusCode) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, applicationStatusCode, httpStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseFailureCopyWith<_$_ResponseFailure> get copyWith =>
      __$$_ResponseFailureCopyWithImpl<_$_ResponseFailure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseFailureToJson(
      this,
    );
  }
}

abstract class _ResponseFailure implements ResponseFailure {
  const factory _ResponseFailure(
      {final String? message,
      final int? applicationStatusCode,
      final int? httpStatus}) = _$_ResponseFailure;

  factory _ResponseFailure.fromJson(Map<String, dynamic> json) =
      _$_ResponseFailure.fromJson;

  @override
  String? get message;
  @override
  int? get applicationStatusCode;
  @override
  int? get httpStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseFailureCopyWith<_$_ResponseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
