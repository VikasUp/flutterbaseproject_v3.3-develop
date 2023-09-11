import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/data/datasources/forgot_password_datasource.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, bool>> forgotPassword(String email);
}

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDatasource datasource;

  ForgotPasswordRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> forgotPassword(String email) async {
    try {
      final success = await datasource.forgotPassword(email);
      if (success == true) {
        return const Right(true);
      } else {
        return Left(ServerException());
      }
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

}