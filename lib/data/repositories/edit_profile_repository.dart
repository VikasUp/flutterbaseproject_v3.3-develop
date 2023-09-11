// import 'package:base_project/core/error/exception.dart';
// import 'package:base_project/data/datasources/edit_profile_datasource.dart';
// import 'package:base_project/data/models/index.dart';
// import 'package:base_project/data/models/paginated_list_response.dart';
// import 'package:dartz/dartz.dart';


// abstract class EditProfileRepository {
//   Future<Either<Failure, bool>> updateProfile(
//       String? firstName,
//       String? lastName,
//       String? email,
//       int? phoneNumber,
//       String? countryCode,
//       String? authToken);

//   Future<Either<Failure, PaginatedListResponse<UserModel>>> fetchUserListing(
//       int pageNo, int size);
// }

// class EditProfileRepositoryImpl implements EditProfileRepository {
//   final EditProfileDatasource datasource;

//   EditProfileRepositoryImpl(this.datasource);

//   @override
//   Future<Either<Failure, bool>> updateProfile(
//       String? firstName,
//       String? lastName,
//       String? email,
//       int? phoneNumber,
//       String? countryCode,
//       String? authToken) async {
//     try {
//       final success = await datasource.updateProfile(
//           firstName, lastName, email, phoneNumber, countryCode, authToken);
//       return Right(success);
//     } on Failure catch (e) {
//       return Left(e);
//     } catch (e) {
//       return Left(UnknownException(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, PaginatedListResponse<UserModel>>> fetchUserListing(
//       int pageNo, int size) async {
//     try {
//       final success = await datasource.fetchUserListing(pageNo, size);
//       return Right(success);
//     } on Failure catch (e) {
//       return Left(e);
//     } catch (e) {
//       return Left(UnknownException(e.toString()));
//     }
//   }
// }
