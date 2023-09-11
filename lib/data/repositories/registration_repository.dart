import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/data/datasources/registration_datasource.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, bool>> userRegister(String email, String password, String firstName, String lastName, String username, int? phoneNumber);
}

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDatasource datasource;

  RegistrationRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> userRegister(String email, String password, String firstName, String lastName, String username, int? phoneNumber) async{
    try {
      final isSuccess = await datasource.userRegister(email, password, firstName, lastName, username, phoneNumber);
      if (isSuccess == true) {
        return const Right(true);
      } else {
        return Left(ServerException());
      }
    }  on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

}