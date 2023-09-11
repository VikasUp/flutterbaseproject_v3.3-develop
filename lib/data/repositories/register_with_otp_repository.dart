import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/data/datasources/register_with_otp_datasource.dart';
import '/domain/entities/country_code.dart';
import '/domain/entities/otp_sent.dart';

abstract class RegisterWithOTPRepository {
  Future<Either<Failure, OTPSent>> sendOTP(String channel, String to, String? countryCode);
  Future<Either<Failure, List<CountryCode>>> getCountryCode();
}

class RegisterWithOTPRepositoryImpl implements RegisterWithOTPRepository {
  final RegisterWithOTPDatasource datasource;

  RegisterWithOTPRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<CountryCode>>> getCountryCode() async{
    try {
      final countryCodeModels = await datasource.getCountryCode();
      final list = countryCodeModels.map((e) => CountryCode.fromJson(e.toJson())).toList();
      return Right(list);
    } on Failure catch(e) {
      return Left(e);
    } catch (error) {
      return Left(UnknownException(error.toString()));
    }
  }

  @override
  Future<Either<Failure, OTPSent>> sendOTP(String channel, String to, String? countryCode) async{
    try {
      final response = await datasource.sendOTP(channel: channel, to: to, countryCode: countryCode);
      return Right(OTPSent.fromJson(response.toJson()));
    } on Failure catch(e) {
      return Left(e);
    } catch (error) {
      return Left(UnknownException(error.toString()));
    }
  }

}