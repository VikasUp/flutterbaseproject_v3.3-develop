import 'package:base_project/core/error/exception.dart';
import 'package:base_project/data/datasources/breakers_datasource.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:dartz/dartz.dart';

abstract class BreakersRepository {
  Future<Either<Failure, List<TeamResponse>>> teamsResponse();

  Future<Either<Failure, List<DivisionResponse>>> divisionResponse();

  Future<Either<Failure, List<DivisionResponse>>> saveResponse();
}

class BreakersRepositoryImpl implements BreakersRepository {
  final BreakersDatasource datasource;

  BreakersRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<TeamResponse>>> teamsResponse() async {
    try {
      final token = await datasource.teamResponse();

      return Right(token);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DivisionResponse>>> divisionResponse() async {
    try {
      final token = await datasource.divisionResponse();

      return Right(token);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DivisionResponse>>> saveResponse() async {
    try {
      final token = await datasource.saveResponse();

      return Right(token);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }
}
