// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_sent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpSentModel _$OtpSentModelFromJson(Map<String, dynamic> json) {
  return _OtpSentModel.fromJson(json);
}

/// @nodoc
mixin _$OtpSentModel {
  String? get message => throw _privateConstructorUsedError;
  int? get httpStatus => throw _privateConstructorUsedError;
  int? get applicationStatusCode => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  bool? get userActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpSentModelCopyWith<OtpSentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpSentModelCopyWith<$Res> {
  factory $OtpSentModelCopyWith(
          OtpSentModel value, $Res Function(OtpSentModel) then) =
      _$OtpSentModelCopyWithImpl<$Res, OtpSentModel>;
  @useResult
  $Res call(
      {String? message,
      int? httpStatus,
      int? applicationStatusCode,
      int? id,
      bool? userActive});
}

/// @nodoc
class _$OtpSentModelCopyWithImpl<$Res, $Val extends OtpSentModel>
    implements $OtpSentModelCopyWith<$Res> {
  _$OtpSentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? httpStatus = freezed,
    Object? applicationStatusCode = freezed,
    Object? id = freezed,
    Object? userActive = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userActive: freezed == userActive
          ? _value.userActive
          : userActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpSentModelCopyWith<$Res>
    implements $OtpSentModelCopyWith<$Res> {
  factory _$$_OtpSentModelCopyWith(
          _$_OtpSentModel value, $Res Function(_$_OtpSentModel) then) =
      __$$_OtpSentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      int? httpStatus,
      int? applicationStatusCode,
      int? id,
      bool? userActive});
}

/// @nodoc
class __$$_OtpSentModelCopyWithImpl<$Res>
    extends _$OtpSentModelCopyWithImpl<$Res, _$_OtpSentModel>
    implements _$$_OtpSentModelCopyWith<$Res> {
  __$$_OtpSentModelCopyWithImpl(
      _$_OtpSentModel _value, $Res Function(_$_OtpSentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? httpStatus = freezed,
    Object? applicationStatusCode = freezed,
    Object? id = freezed,
    Object? userActive = freezed,
  }) {
    return _then(_$_OtpSentModel(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      applicationStatusCode: freezed == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userActive: freezed == userActive
          ? _value.userActive
          : userActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtpSentModel implements _OtpSentModel {
  const _$_OtpSentModel(
      {this.message,
      this.httpStatus,
      this.applicationStatusCode,
      this.id,
      this.userActive});

  factory _$_OtpSentModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtpSentModelFromJson(json);

  @override
  final String? message;
  @override
  final int? httpStatus;
  @override
  final int? applicationStatusCode;
  @override
  final int? id;
  @override
  final bool? userActive;

  @override
  String toString() {
    return 'OtpSentModel(message: $message, httpStatus: $httpStatus, applicationStatusCode: $applicationStatusCode, id: $id, userActive: $userActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpSentModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.applicationStatusCode, applicationStatusCode) ||
                other.applicationStatusCode == applicationStatusCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userActive, userActive) ||
                other.userActive == userActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, httpStatus, applicationStatusCode, id, userActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpSentModelCopyWith<_$_OtpSentModel> get copyWith =>
      __$$_OtpSentModelCopyWithImpl<_$_OtpSentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtpSentModelToJson(
      this,
    );
  }
}

abstract class _OtpSentModel implements OtpSentModel {
  const factory _OtpSentModel(
      {final String? message,
      final int? httpStatus,
      final int? applicationStatusCode,
      final int? id,
      final bool? userActive}) = _$_OtpSentModel;

  factory _OtpSentModel.fromJson(Map<String, dynamic> json) =
      _$_OtpSentModel.fromJson;

  @override
  String? get message;
  @override
  int? get httpStatus;
  @override
  int? get applicationStatusCode;
  @override
  int? get id;
  @override
  bool? get userActive;
  @override
  @JsonKey(ignore: true)
  _$$_OtpSentModelCopyWith<_$_OtpSentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
