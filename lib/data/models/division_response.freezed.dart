// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'division_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DivisionResponse _$DivisionResponseFromJson(Map<String, dynamic> json) {
  return _DivisionResponse.fromJson(json);
}

/// @nodoc
mixin _$DivisionResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<TeamResponse>? get teams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DivisionResponseCopyWith<DivisionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DivisionResponseCopyWith<$Res> {
  factory $DivisionResponseCopyWith(
          DivisionResponse value, $Res Function(DivisionResponse) then) =
      _$DivisionResponseCopyWithImpl<$Res, DivisionResponse>;
  @useResult
  $Res call({int? id, String? name, List<TeamResponse>? teams});
}

/// @nodoc
class _$DivisionResponseCopyWithImpl<$Res, $Val extends DivisionResponse>
    implements $DivisionResponseCopyWith<$Res> {
  _$DivisionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? teams = freezed,
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
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DivisionResponseCopyWith<$Res>
    implements $DivisionResponseCopyWith<$Res> {
  factory _$$_DivisionResponseCopyWith(
          _$_DivisionResponse value, $Res Function(_$_DivisionResponse) then) =
      __$$_DivisionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<TeamResponse>? teams});
}

/// @nodoc
class __$$_DivisionResponseCopyWithImpl<$Res>
    extends _$DivisionResponseCopyWithImpl<$Res, _$_DivisionResponse>
    implements _$$_DivisionResponseCopyWith<$Res> {
  __$$_DivisionResponseCopyWithImpl(
      _$_DivisionResponse _value, $Res Function(_$_DivisionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? teams = freezed,
  }) {
    return _then(_$_DivisionResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teams: freezed == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DivisionResponse implements _DivisionResponse {
  const _$_DivisionResponse(
      {this.id, this.name, final List<TeamResponse>? teams})
      : _teams = teams;

  factory _$_DivisionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DivisionResponseFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<TeamResponse>? _teams;
  @override
  List<TeamResponse>? get teams {
    final value = _teams;
    if (value == null) return null;
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DivisionResponse(id: $id, name: $name, teams: $teams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DivisionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_teams));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DivisionResponseCopyWith<_$_DivisionResponse> get copyWith =>
      __$$_DivisionResponseCopyWithImpl<_$_DivisionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DivisionResponseToJson(
      this,
    );
  }
}

abstract class _DivisionResponse implements DivisionResponse {
  const factory _DivisionResponse(
      {final int? id,
      final String? name,
      final List<TeamResponse>? teams}) = _$_DivisionResponse;

  factory _DivisionResponse.fromJson(Map<String, dynamic> json) =
      _$_DivisionResponse.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<TeamResponse>? get teams;
  @override
  @JsonKey(ignore: true)
  _$$_DivisionResponseCopyWith<_$_DivisionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
