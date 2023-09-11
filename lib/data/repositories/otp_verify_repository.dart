import 'package:dartz/dartz.dart';

import '/core/error/exception.dart';
import '/data/datasources/otp_verify_datasource.dart';
import '/domain/entities/index.dart';

abstract class OTPVerifyRepository {
  Future<Either<Failure, OTPVerified>> otpVerify(String channel, String countryCode, String to, String otp);
}

class OTPVerifyRepositoryImpl implements OTPVerifyRepository {
  final OTPVerifyDatasource datasource;

  OTPVerifyRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, OTPVerified>> otpVerify(String channel, String countryCode, String to, String otp) async{
    try {
      final response = await datasource.otpVerify(channel, countryCode, to, otp);
      final json = response.toJson();
      final otpVerify = OTPVerified.fromJson(json);
      return Right(otpVerify);
    } on Failure catch (error) {
      return Left(error);
    } catch (e) {
      return Left(UnknownException(e.toString()));
    }
  }

}