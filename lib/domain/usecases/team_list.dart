import 'package:base_project/data/models/teams_response.dart';
import 'package:base_project/data/repositories/breakers_repository.dart';
import 'package:dartz/dartz.dart';
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';

class Teams implements UseCase<List<TeamResponse>, teamsResponse> {
  final BreakersRepository repository;

  Teams(this.repository);

  @override
  Future<Either<Failure, List<TeamResponse>>> call(String) async {
    return await repository.teamsResponse();
  }
}

class teamsResponse implements NoParam {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
