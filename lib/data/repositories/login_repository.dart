import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/data/datasources/login_datasource.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> loginUser(String username, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, String>> loginUser(String username, String password) async {
    try {
      final token = await datasource.loginUser(username, password);
      return Right(token);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

}