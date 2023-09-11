
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/register_with_otp_repository.dart';
import '/domain/entities/country_code.dart';
import 'package:dartz/dartz.dart';

class GetCountryCode implements UseCase<List<CountryCode>, NoParam> {

  final RegisterWithOTPRepository repository;

  GetCountryCode(this.repository);

  @override
  Future<Either<Failure, List<CountryCode>>> call(NoParam params) async{
    return await repository.getCountryCode();
  }

}