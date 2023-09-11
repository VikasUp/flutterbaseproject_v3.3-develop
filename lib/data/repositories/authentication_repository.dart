import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/core/error/error_index.dart';
import '/data/datasources/local_datasource.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> clearToken();
  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, bool>> storeToken(String token);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;
  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, bool>> clearToken() async {
    dataSource.clearToken();
    return const Right(true);
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await dataSource.getToken();
    if (token != null) {
      return Right(token);
    } else {
      return Left(CacheException());
    }
  }

  @override
  Future<Either<Failure, bool>> storeToken(String token) async {
    await dataSource.storeToken(token);
    return const Right(true);
  }
}
