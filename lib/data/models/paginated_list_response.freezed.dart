// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedListResponse<T> _$PaginatedListResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginatedListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginatedListResponse<T> {
  List<T>? get content => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;
  bool? get first => throw _privateConstructorUsedError;
  bool? get last => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int? get numberOfElements => throw _privateConstructorUsedError;
  PageableResponse? get pageable => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  SortResponse? get sort => throw _privateConstructorUsedError;
  int? get totalElements => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedListResponseCopyWith<T, PaginatedListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListResponseCopyWith<T, $Res> {
  factory $PaginatedListResponseCopyWith(PaginatedListResponse<T> value,
          $Res Function(PaginatedListResponse<T>) then) =
      _$PaginatedListResponseCopyWithImpl<T, $Res, PaginatedListResponse<T>>;
  @useResult
  $Res call(
      {List<T>? content,
      bool? empty,
      bool? first,
      bool? last,
      int? number,
      int? numberOfElements,
      PageableResponse? pageable,
      int? size,
      SortResponse? sort,
      int? totalElements,
      int? totalPages});

  $PageableResponseCopyWith<$Res>? get pageable;
  $SortResponseCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PaginatedListResponseCopyWithImpl<T, $Res,
        $Val extends PaginatedListResponse<T>>
    implements $PaginatedListResponseCopyWith<T, $Res> {
  _$PaginatedListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? empty = freezed,
    Object? first = freezed,
    Object? last = freezed,
    Object? number = freezed,
    Object? numberOfElements = freezed,
    Object? pageable = freezed,
    Object? size = freezed,
    Object? sort = freezed,
    Object? totalElements = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      pageable: freezed == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as PageableResponse?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortResponse?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageableResponseCopyWith<$Res>? get pageable {
    if (_value.pageable == null) {
      return null;
    }

    return $PageableResponseCopyWith<$Res>(_value.pageable!, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
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
abstract class _$$_PaginatedListResponseCopyWith<T, $Res>
    implements $PaginatedListResponseCopyWith<T, $Res> {
  factory _$$_PaginatedListResponseCopyWith(_$_PaginatedListResponse<T> value,
          $Res Function(_$_PaginatedListResponse<T>) then) =
      __$$_PaginatedListResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T>? content,
      bool? empty,
      bool? first,
      bool? last,
      int? number,
      int? numberOfElements,
      PageableResponse? pageable,
      int? size,
      SortResponse? sort,
      int? totalElements,
      int? totalPages});

  @override
  $PageableResponseCopyWith<$Res>? get pageable;
  @override
  $SortResponseCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$_PaginatedListResponseCopyWithImpl<T, $Res>
    extends _$PaginatedListResponseCopyWithImpl<T, $Res,
        _$_PaginatedListResponse<T>>
    implements _$$_PaginatedListResponseCopyWith<T, $Res> {
  __$$_PaginatedListResponseCopyWithImpl(_$_PaginatedListResponse<T> _value,
      $Res Function(_$_PaginatedListResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? empty = freezed,
    Object? first = freezed,
    Object? last = freezed,
    Object? number = freezed,
    Object? numberOfElements = freezed,
    Object? pageable = freezed,
    Object? size = freezed,
    Object? sort = freezed,
    Object? totalElements = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_$_PaginatedListResponse<T>(
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      pageable: freezed == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as PageableResponse?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortResponse?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_PaginatedListResponse<T> implements _PaginatedListResponse<T> {
  const _$_PaginatedListResponse(
      {final List<T>? content,
      this.empty,
      this.first,
      this.last,
      this.number,
      this.numberOfElements,
      this.pageable,
      this.size,
      this.sort,
      this.totalElements,
      this.totalPages})
      : _content = content;

  factory _$_PaginatedListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PaginatedListResponseFromJson(json, fromJsonT);

  final List<T>? _content;
  @override
  List<T>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? empty;
  @override
  final bool? first;
  @override
  final bool? last;
  @override
  final int? number;
  @override
  final int? numberOfElements;
  @override
  final PageableResponse? pageable;
  @override
  final int? size;
  @override
  final SortResponse? sort;
  @override
  final int? totalElements;
  @override
  final int? totalPages;

  @override
  String toString() {
    return 'PaginatedListResponse<$T>(content: $content, empty: $empty, first: $first, last: $last, number: $number, numberOfElements: $numberOfElements, pageable: $pageable, size: $size, sort: $sort, totalElements: $totalElements, totalPages: $totalPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedListResponse<T> &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.empty, empty) || other.empty == empty) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.numberOfElements, numberOfElements) ||
                other.numberOfElements == numberOfElements) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      empty,
      first,
      last,
      number,
      numberOfElements,
      pageable,
      size,
      sort,
      totalElements,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedListResponseCopyWith<T, _$_PaginatedListResponse<T>>
      get copyWith => __$$_PaginatedListResponseCopyWithImpl<T,
          _$_PaginatedListResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PaginatedListResponseToJson<T>(this, toJsonT);
  }
}

abstract class _PaginatedListResponse<T> implements PaginatedListResponse<T> {
  const factory _PaginatedListResponse(
      {final List<T>? content,
      final bool? empty,
      final bool? first,
      final bool? last,
      final int? number,
      final int? numberOfElements,
      final PageableResponse? pageable,
      final int? size,
      final SortResponse? sort,
      final int? totalElements,
      final int? totalPages}) = _$_PaginatedListResponse<T>;

  factory _PaginatedListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_PaginatedListResponse<T>.fromJson;

  @override
  List<T>? get content;
  @override
  bool? get empty;
  @override
  bool? get first;
  @override
  bool? get last;
  @override
  int? get number;
  @override
  int? get numberOfElements;
  @override
  PageableResponse? get pageable;
  @override
  int? get size;
  @override
  SortResponse? get sort;
  @override
  int? get totalElements;
  @override
  int? get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedListResponseCopyWith<T, _$_PaginatedListResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}
