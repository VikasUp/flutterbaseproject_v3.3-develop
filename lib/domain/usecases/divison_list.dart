import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/repositories/breakers_repository.dart';
import 'package:dartz/dartz.dart';
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';

class Division implements UseCase<List<DivisionResponse>, divisionResponse> {
  final BreakersRepository repository;

  Division(this.repository);

  @override
  Future<Either<Failure, List<DivisionResponse>>> call(String) async {
    return await repository.divisionResponse();
  }
}

class divisionResponse implements NoParam {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
