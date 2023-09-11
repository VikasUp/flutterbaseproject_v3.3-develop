// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortResponse _$SortResponseFromJson(Map<String, dynamic> json) {
  return _SortResponse.fromJson(json);
}

/// @nodoc
mixin _$SortResponse {
  bool? get sorted => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;
  bool? get unsorted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortResponseCopyWith<SortResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortResponseCopyWith<$Res> {
  factory $SortResponseCopyWith(
          SortResponse value, $Res Function(SortResponse) then) =
      _$SortResponseCopyWithImpl<$Res, SortResponse>;
  @useResult
  $Res call({bool? sorted, bool? empty, bool? unsorted});
}

/// @nodoc
class _$SortResponseCopyWithImpl<$Res, $Val extends SortResponse>
    implements $SortResponseCopyWith<$Res> {
  _$SortResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorted = freezed,
    Object? empty = freezed,
    Object? unsorted = freezed,
  }) {
    return _then(_value.copyWith(
      sorted: freezed == sorted
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
      unsorted: freezed == unsorted
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortResponseCopyWith<$Res>
    implements $SortResponseCopyWith<$Res> {
  factory _$$_SortResponseCopyWith(
          _$_SortResponse value, $Res Function(_$_SortResponse) then) =
      __$$_SortResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? sorted, bool? empty, bool? unsorted});
}

/// @nodoc
class __$$_SortResponseCopyWithImpl<$Res>
    extends _$SortResponseCopyWithImpl<$Res, _$_SortResponse>
    implements _$$_SortResponseCopyWith<$Res> {
  __$$_SortResponseCopyWithImpl(
      _$_SortResponse _value, $Res Function(_$_SortResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorted = freezed,
    Object? empty = freezed,
    Object? unsorted = freezed,
  }) {
    return _then(_$_SortResponse(
      sorted: freezed == sorted
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
      unsorted: freezed == unsorted
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortResponse implements _SortResponse {
  const _$_SortResponse({this.sorted, this.empty, this.unsorted});

  factory _$_SortResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SortResponseFromJson(json);

  @override
  final bool? sorted;
  @override
  final bool? empty;
  @override
  final bool? unsorted;

  @override
  String toString() {
    return 'SortResponse(sorted: $sorted, empty: $empty, unsorted: $unsorted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortResponse &&
            (identical(other.sorted, sorted) || other.sorted == sorted) &&
            (identical(other.empty, empty) || other.empty == empty) &&
            (identical(other.unsorted, unsorted) ||
                other.unsorted == unsorted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sorted, empty, unsorted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortResponseCopyWith<_$_SortResponse> get copyWith =>
      __$$_SortResponseCopyWithImpl<_$_SortResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortResponseToJson(
      this,
    );
  }
}

abstract class _SortResponse implements SortResponse {
  const factory _SortResponse(
      {final bool? sorted,
      final bool? empty,
      final bool? unsorted}) = _$_SortResponse;

  factory _SortResponse.fromJson(Map<String, dynamic> json) =
      _$_SortResponse.fromJson;

  @override
  bool? get sorted;
  @override
  bool? get empty;
  @override
  bool? get unsorted;
  @override
  @JsonKey(ignore: true)
  _$$_SortResponseCopyWith<_$_SortResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
