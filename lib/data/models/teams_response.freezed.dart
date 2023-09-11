// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teams_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) {
  return _TeamResponse.fromJson(json);
}

/// @nodoc
mixin _$TeamResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamResponseCopyWith<TeamResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamResponseCopyWith<$Res> {
  factory $TeamResponseCopyWith(
          TeamResponse value, $Res Function(TeamResponse) then) =
      _$TeamResponseCopyWithImpl<$Res, TeamResponse>;
  @useResult
  $Res call({int? id, String? name, String? imageUrl});
}

/// @nodoc
class _$TeamResponseCopyWithImpl<$Res, $Val extends TeamResponse>
    implements $TeamResponseCopyWith<$Res> {
  _$TeamResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamResponseCopyWith<$Res>
    implements $TeamResponseCopyWith<$Res> {
  factory _$$_TeamResponseCopyWith(
          _$_TeamResponse value, $Res Function(_$_TeamResponse) then) =
      __$$_TeamResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? imageUrl});
}

/// @nodoc
class __$$_TeamResponseCopyWithImpl<$Res>
    extends _$TeamResponseCopyWithImpl<$Res, _$_TeamResponse>
    implements _$$_TeamResponseCopyWith<$Res> {
  __$$_TeamResponseCopyWithImpl(
      _$_TeamResponse _value, $Res Function(_$_TeamResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_TeamResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamResponse implements _TeamResponse {
  const _$_TeamResponse({this.id, this.name, this.imageUrl});

  factory _$_TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TeamResponseFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'TeamResponse(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamResponseCopyWith<_$_TeamResponse> get copyWith =>
      __$$_TeamResponseCopyWithImpl<_$_TeamResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamResponseToJson(
      this,
    );
  }
}

abstract class _TeamResponse implements TeamResponse {
  const factory _TeamResponse(
      {final int? id,
      final String? name,
      final String? imageUrl}) = _$_TeamResponse;

  factory _TeamResponse.fromJson(Map<String, dynamic> json) =
      _$_TeamResponse.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TeamResponseCopyWith<_$_TeamResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
