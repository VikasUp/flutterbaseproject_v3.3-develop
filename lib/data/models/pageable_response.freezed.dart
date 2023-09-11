// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pageable_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageableResponse _$PageableResponseFromJson(Map<String, dynamic> json) {
  return _PageableResponse.fromJson(json);
}

/// @nodoc
mixin _$PageableResponse {
  int? get offset => throw _privateConstructorUsedError;
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  bool? get paged => throw _privateConstructorUsedError;
  SortResponse? get sort => throw _privateConstructorUsedError;
  bool? get unpaged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageableResponseCopyWith<PageableResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableResponseCopyWith<$Res> {
  factory $PageableResponseCopyWith(
          PageableResponse value, $Res Function(PageableResponse) then) =
      _$PageableResponseCopyWithImpl<$Res, PageableResponse>;
  @useResult
  $Res call(
      {int? offset,
      int? pageNumber,
      int? pageSize,
      bool? paged,
      SortResponse? sort,
      bool? unpaged});

  $SortResponseCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PageableResponseCopyWithImpl<$Res, $Val extends PageableResponse>
    implements $PageableResponseCopyWith<$Res> {
  _$PageableResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = freezed,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? paged = freezed,
    Object? sort = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(_value.copyWith(
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      paged: freezed == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortResponse?,
      unpaged: freezed == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SortResponseCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortResponseCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PageableResponseCopyWith<$Res>
    implements $PageableResponseCopyWith<$Res> {
  factory _$$_PageableResponseCopyWith(
          _$_PageableResponse value, $Res Function(_$_PageableResponse) then) =
      __$$_PageableResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? offset,
      int? pageNumber,
      int? pageSize,
      bool? paged,
      SortResponse? sort,
      bool? unpaged});

  @override
  $SortResponseCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$_PageableResponseCopyWithImpl<$Res>
    extends _$PageableResponseCopyWithImpl<$Res, _$_PageableResponse>
    implements _$$_PageableResponseCopyWith<$Res> {
  __$$_PageableResponseCopyWithImpl(
      _$_PageableResponse _value, $Res Function(_$_PageableResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = freezed,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? paged = freezed,
    Object? sort = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(_$_PageableResponse(
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      paged: freezed == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortResponse?,
      unpaged: freezed == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageableResponse implements _PageableResponse {
  const _$_PageableResponse(
      {this.offset,
      this.pageNumber,
      this.pageSize,
      this.paged,
      this.sort,
      this.unpaged});

  factory _$_PageableResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PageableResponseFromJson(json);

  @override
  final int? offset;
  @override
  final int? pageNumber;
  @override
  final int? pageSize;
  @override
  final bool? paged;
  @override
  final SortResponse? sort;
  @override
  final bool? unpaged;

  @override
  String toString() {
    return 'PageableResponse(offset: $offset, pageNumber: $pageNumber, pageSize: $pageSize, paged: $paged, sort: $sort, unpaged: $unpaged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageableResponse &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.paged, paged) || other.paged == paged) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.unpaged, unpaged) || other.unpaged == unpaged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, offset, pageNumber, pageSize, paged, sort, unpaged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageableResponseCopyWith<_$_PageableResponse> get copyWith =>
      __$$_PageableResponseCopyWithImpl<_$_PageableResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageableResponseToJson(
      this,
    );
  }
}

abstract class _PageableResponse implements PageableResponse {
  const factory _PageableResponse(
      {final int? offset,
      final int? pageNumber,
      final int? pageSize,
      final bool? paged,
      final SortResponse? sort,
      final bool? unpaged}) = _$_PageableResponse;

  factory _PageableResponse.fromJson(Map<String, dynamic> json) =
      _$_PageableResponse.fromJson;

  @override
  int? get offset;
  @override
  int? get pageNumber;
  @override
  int? get pageSize;
  @override
  bool? get paged;
  @override
  SortResponse? get sort;
  @override
  bool? get unpaged;
  @override
  @JsonKey(ignore: true)
  _$$_PageableResponseCopyWith<_$_PageableResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
