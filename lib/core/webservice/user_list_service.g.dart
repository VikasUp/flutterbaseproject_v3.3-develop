// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_list_service.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

// class _UserListService implements UserListService {
//   _UserListService(
//     this._dio, {
//     this.baseUrl,
//   });

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<HttpResponse<PaginatedListResponse<UserModel>>> fetchUserListing(
//     pageNo,
//     size,
//   ) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<PaginatedListResponse<UserModel>>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/paginated-sfl-users?status=true&pageNumber=${pageNo}&pageSize=${size}',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = PaginatedListResponse<UserModel>.fromJson(
//       _result.data!,
//       (json) => UserModel.fromJson(json as Map<String, dynamic>),
//     );
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
