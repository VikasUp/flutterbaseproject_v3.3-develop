// import 'package:base_project/core/util/extensions.dart';
// import 'package:base_project/data/models/index.dart';
// import 'package:base_project/data/models/paginated_list_response.dart';

// import '/core/index.dart';

// abstract class HomeDataSource {
//   Future<PaginatedListResponse<UserModel>> getUser(int page);
// }

// class HomeDataSourceImpl implements HomeDataSource {
//   @override
//   Future<PaginatedListResponse<UserModel>> getUser(int page) async {
//     try {
//       final response = await ApiClient.userListService.fetchUserListing(
//         page,
//         SFLStrings.customKeys.genericPageSize,
//       );
//       if (response.isSuccessful) {
//         final objUsersResponse = response.data;
//         return objUsersResponse;
//       } else {
//         throw ServerException();
//       }
//     } on Failure catch (_) {
//       rethrow;
//     } catch (error) {
//       throw UnknownException(error.toString());
//     }
//   }
// }
