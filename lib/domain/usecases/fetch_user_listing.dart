// import 'package:base_project/core/error/exception.dart';
// import 'package:base_project/core/usecase/usecase.dart';
// import 'package:base_project/data/models/paginated_list_response.dart';
// import 'package:base_project/data/models/user_model.dart';
// import 'package:base_project/data/repositories/index.dart';
// import 'package:dartz/dartz.dart';

// class FetchUserListing
//     implements
//         UseCase<PaginatedListResponse<UserModel>, FetchUserListingParam> {
//   final EditProfileRepository repository;

//   FetchUserListing(this.repository);

//   @override
//   Future<Either<Failure, PaginatedListResponse<UserModel>>> call(
//       FetchUserListingParam params) async {
//     return await repository.fetchUserListing(params.pageNo, params.size);
//   }
// }

// class FetchUserListingParam implements NoParam {
//   final int pageNo;
//   final int size;

//   FetchUserListingParam(this.pageNo, this.size);

//   @override
//   List<Object?> get props => [pageNo, size];

//   @override
//   bool? get stringify => true;
// }
