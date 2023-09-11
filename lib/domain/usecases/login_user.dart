
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUser implements UseCase<String, LoginUserParam> {
  
  final LoginRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginUserParam params) {
    return repository.loginUser(params.username, params.password);
  }
}

class LoginUserParam implements NoParam {
  final String username;
  final String password;

  LoginUserParam(this.username, this.password);

  @override
  List<Object?> get props => [username, password];

  @override
  bool? get stringify => true;

}