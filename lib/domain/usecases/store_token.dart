
import '/core/error/error_index.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class StoreToken implements UseCase<bool, TokenParam> {

  final AuthenticationRepository repository;

  StoreToken(this.repository);

  @override
  Future<Either<Failure, bool>> call(TokenParam params) async{
    return repository.storeToken(params.token);
  }
}

class TokenParam implements NoParam {
  final String token;

  TokenParam(this.token);

  @override
  List<Object?> get props => [token];

  @override
  bool? get stringify => throw UnimplementedError();
}