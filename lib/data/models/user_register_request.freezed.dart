// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) {
  return _UserRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterRequestCopyWith<UserRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterRequestCopyWith<$Res> {
  factory $UserRegisterRequestCopyWith(
          UserRegisterRequest value, $Res Function(UserRegisterRequest) then) =
      _$UserRegisterRequestCopyWithImpl<$Res, UserRegisterRequest>;
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String lastName,
      String userName,
      bool status,
      int? phoneNumber});
}

/// @nodoc
class _$UserRegisterRequestCopyWithImpl<$Res, $Val extends UserRegisterRequest>
    implements $UserRegisterRequestCopyWith<$Res> {
  _$UserRegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? status = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegisterRequestCopyWith<$Res>
    implements $UserRegisterRequestCopyWith<$Res> {
  factory _$$_UserRegisterRequestCopyWith(_$_UserRegisterRequest value,
          $Res Function(_$_UserRegisterRequest) then) =
      __$$_UserRegisterRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String lastName,
      String userName,
      bool status,
      int? phoneNumber});
}

/// @nodoc
class __$$_UserRegisterRequestCopyWithImpl<$Res>
    extends _$UserRegisterRequestCopyWithImpl<$Res, _$_UserRegisterRequest>
    implements _$$_UserRegisterRequestCopyWith<$Res> {
  __$$_UserRegisterRequestCopyWithImpl(_$_UserRegisterRequest _value,
      $Res Function(_$_UserRegisterRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? status = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_UserRegisterRequest(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRegisterRequest implements _UserRegisterRequest {
  const _$_UserRegisterRequest(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.status,
      this.phoneNumber});

  factory _$_UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegisterRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String userName;
  @override
  final bool status;
  @override
  final int? phoneNumber;

  @override
  String toString() {
    return 'UserRegisterRequest(email: $email, password: $password, firstName: $firstName, lastName: $lastName, userName: $userName, status: $status, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegisterRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, firstName,
      lastName, userName, status, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegisterRequestCopyWith<_$_UserRegisterRequest> get copyWith =>
      __$$_UserRegisterRequestCopyWithImpl<_$_UserRegisterRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegisterRequestToJson(
      this,
    );
  }
}

abstract class _UserRegisterRequest implements UserRegisterRequest {
  const factory _UserRegisterRequest(
      {required final String email,
      required final String password,
      required final String firstName,
      required final String lastName,
      required final String userName,
      required final bool status,
      final int? phoneNumber}) = _$_UserRegisterRequest;

  factory _UserRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$_UserRegisterRequest.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get userName;
  @override
  bool get status;
  @override
  int? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegisterRequestCopyWith<_$_UserRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
