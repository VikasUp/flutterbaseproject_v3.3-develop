// import 'package:base_project/core/error/exception.dart';
// import 'package:base_project/core/util/extensions.dart';
// import 'package:base_project/core/webservice/api_client.dart';
// import 'package:base_project/data/models/index.dart';
// import 'package:base_project/data/models/paginated_list_response.dart';

// import 'package:retrofit/dio.dart';

// abstract class EditProfileDatasource {
//   Future<bool> updateProfile(String? firstName, String? lastName, String? email,
//       int? phoneNumber, String? countryCode, String? authToken);
//   Future<PaginatedListResponse<UserModel>> fetchUserListing(
//       int pageNo, int size);
// }

// class EditProfileDatasourceImpl implements EditProfileDatasource {
//   @override
//   Future<bool> updateProfile(String? firstName, String? lastName, String? email,
//       int? phoneNumber, String? countryCode, String? authToken) async {
//     try {
//       var countryDialCode = CountryDialCode(dialCode: countryCode);
//       var editProfileRequest = EditProfileRequest(
//           email: email,
//           firstName: firstName,
//           lastName: lastName,
//           authToken: authToken,
//           phoneNumber: phoneNumber,
//           countryDialCode: countryDialCode);
//       HttpResponse<EditProfileResponse> response =
//           await ApiClient.editProfileService.editProfile(editProfileRequest);
//       if (response.isSuccessful) {
//         return true;
//       } else {
//         throw ServerException(response.data.message ?? '');
//       }
//     } on Failure catch (_) {
//       rethrow;
//     } catch (error) {
//       throw UnknownException(error.toString());
//     }
//   }

//   @override
//   Future<PaginatedListResponse<UserModel>> fetchUserListing(
//       int pageNo, int size) async {
//     try {
//       HttpResponse<PaginatedListResponse<UserModel>> response =
//           await ApiClient.userListService.fetchUserListing(pageNo, size);

//       if (response.isSuccessful) {
//         return response.data;
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
