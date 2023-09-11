
import '/core/error/error_index.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class ClearToken implements UseCase<bool,NoParam> {
  final AuthenticationRepository repository;
  ClearToken(this.repository);
  @override
  Future<Either<Failure, bool>> call(NoParam params) {
    return repository.clearToken();
  }
}