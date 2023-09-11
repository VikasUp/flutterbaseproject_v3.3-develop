
import '/core/error/error_index.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/home_repository.dart';
import '/domain/entities/users.dart';
import 'package:dartz/dartz.dart';

class GetUser implements UseCase<Users, GetUserParam> {
  final HomeRepository repository;
  GetUser(this.repository);

  @override
  Future<Either<Failure, Users>> call(GetUserParam params) async {
    return await repository.getUser(params.page);
  }
}

class GetUserParam implements NoParam {

  final int page;
  GetUserParam(this.page);

  @override
  List<Object?> get props => [page];
  @override
  bool? get stringify => true;

}

