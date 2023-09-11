// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryCodeModel _$CountryCodeModelFromJson(Map<String, dynamic> json) {
  return _CountryCodeModel.fromJson(json);
}

/// @nodoc
mixin _$CountryCodeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCodeModelCopyWith<CountryCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeModelCopyWith<$Res> {
  factory $CountryCodeModelCopyWith(
          CountryCodeModel value, $Res Function(CountryCodeModel) then) =
      _$CountryCodeModelCopyWithImpl<$Res, CountryCodeModel>;
  @useResult
  $Res call({int id, String name, String countryCode});
}

/// @nodoc
class _$CountryCodeModelCopyWithImpl<$Res, $Val extends CountryCodeModel>
    implements $CountryCodeModelCopyWith<$Res> {
  _$CountryCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCodeModelCopyWith<$Res>
    implements $CountryCodeModelCopyWith<$Res> {
  factory _$$_CountryCodeModelCopyWith(
          _$_CountryCodeModel value, $Res Function(_$_CountryCodeModel) then) =
      __$$_CountryCodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String countryCode});
}

/// @nodoc
class __$$_CountryCodeModelCopyWithImpl<$Res>
    extends _$CountryCodeModelCopyWithImpl<$Res, _$_CountryCodeModel>
    implements _$$_CountryCodeModelCopyWith<$Res> {
  __$$_CountryCodeModelCopyWithImpl(
      _$_CountryCodeModel _value, $Res Function(_$_CountryCodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryCode = null,
  }) {
    return _then(_$_CountryCodeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryCodeModel implements _CountryCodeModel {
  const _$_CountryCodeModel(
      {required this.id, required this.name, required this.countryCode});

  factory _$_CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_CountryCodeModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String countryCode;

  @override
  String toString() {
    return 'CountryCodeModel(id: $id, name: $name, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryCodeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCodeModelCopyWith<_$_CountryCodeModel> get copyWith =>
      __$$_CountryCodeModelCopyWithImpl<_$_CountryCodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryCodeModelToJson(
      this,
    );
  }
}

abstract class _CountryCodeModel implements CountryCodeModel {
  const factory _CountryCodeModel(
      {required final int id,
      required final String name,
      required final String countryCode}) = _$_CountryCodeModel;

  factory _CountryCodeModel.fromJson(Map<String, dynamic> json) =
      _$_CountryCodeModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCodeModelCopyWith<_$_CountryCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
