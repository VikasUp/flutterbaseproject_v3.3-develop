// import 'package:base_project/data/models/index.dart';
// import 'package:base_project/data/models/paginated_list_response.dart';
// import 'package:dartz/dartz.dart';

// import '/core/error/error_index.dart';
// import '/data/datasources/home_datasource.dart';
// import '/domain/entities/users.dart';

// abstract class HomeRepository {
//   Future<Either<Failure, Users>> getUser(int page);
// }

// class HomeRepositoryImpl implements HomeRepository {
//   final HomeDataSource dataSource;

//   HomeRepositoryImpl(this.dataSource);

//   @override
//   Future<Either<Failure, Users>> getUser(int page) async {
//     try {
//       final PaginatedListResponse<UserModel> userModel =
//           await dataSource.getUser(page);

//       final json = userModel.toJson(((p0) => p0.toJson()));
//       final users = Users.fromJson(json);
//       return Right(users);
//     } on Failure catch (e) {
//       return Left(e);
//     } catch (error) {
//       return Left(UnknownException(error.toString()));
//     }
//   }
// }
