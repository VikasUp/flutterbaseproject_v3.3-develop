

import '/core/error/error_index.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class GetToken implements UseCase<String,NoParam> {
  final AuthenticationRepository repository;

  GetToken(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParam params) {
    return repository.getToken();
  }
}