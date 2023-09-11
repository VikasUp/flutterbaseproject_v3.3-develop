// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditProfileResponse _$EditProfileResponseFromJson(Map<String, dynamic> json) {
  return _EditProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$EditProfileResponse {
  String? get message => throw _privateConstructorUsedError;
  int? get httpStatus => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditProfileResponseCopyWith<EditProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileResponseCopyWith<$Res> {
  factory $EditProfileResponseCopyWith(
          EditProfileResponse value, $Res Function(EditProfileResponse) then) =
      _$EditProfileResponseCopyWithImpl<$Res, EditProfileResponse>;
  @useResult
  $Res call({String? message, int? httpStatus, String? idToken});
}

/// @nodoc
class _$EditProfileResponseCopyWithImpl<$Res, $Val extends EditProfileResponse>
    implements $EditProfileResponseCopyWith<$Res> {
  _$EditProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? httpStatus = freezed,
    Object? idToken = freezed,
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
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditProfileResponseCopyWith<$Res>
    implements $EditProfileResponseCopyWith<$Res> {
  factory _$$_EditProfileResponseCopyWith(_$_EditProfileResponse value,
          $Res Function(_$_EditProfileResponse) then) =
      __$$_EditProfileResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? httpStatus, String? idToken});
}

/// @nodoc
class __$$_EditProfileResponseCopyWithImpl<$Res>
    extends _$EditProfileResponseCopyWithImpl<$Res, _$_EditProfileResponse>
    implements _$$_EditProfileResponseCopyWith<$Res> {
  __$$_EditProfileResponseCopyWithImpl(_$_EditProfileResponse _value,
      $Res Function(_$_EditProfileResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? httpStatus = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$_EditProfileResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditProfileResponse implements _EditProfileResponse {
  const _$_EditProfileResponse({this.message, this.httpStatus, this.idToken});

  factory _$_EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$$_EditProfileResponseFromJson(json);

  @override
  final String? message;
  @override
  final int? httpStatus;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'EditProfileResponse(message: $message, httpStatus: $httpStatus, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, httpStatus, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileResponseCopyWith<_$_EditProfileResponse> get copyWith =>
      __$$_EditProfileResponseCopyWithImpl<_$_EditProfileResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditProfileResponseToJson(
      this,
    );
  }
}

abstract class _EditProfileResponse implements EditProfileResponse {
  const factory _EditProfileResponse(
      {final String? message,
      final int? httpStatus,
      final String? idToken}) = _$_EditProfileResponse;

  factory _EditProfileResponse.fromJson(Map<String, dynamic> json) =
      _$_EditProfileResponse.fromJson;

  @override
  String? get message;
  @override
  int? get httpStatus;
  @override
  String? get idToken;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileResponseCopyWith<_$_EditProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
