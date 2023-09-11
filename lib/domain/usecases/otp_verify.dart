import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/otp_verify_repository.dart';
import '/domain/entities/index.dart';
import 'package:dartz/dartz.dart';

class OTPVerify implements UseCase<OTPVerified, OTPVerifyParam> {
  final OTPVerifyRepository repository;

  OTPVerify(this.repository);

  @override
  Future<Either<Failure, OTPVerified>> call(OTPVerifyParam params) async {
    return await repository.otpVerify(params.channel, params.countryDialCode, params.to, params.otp);
  }

}

class OTPVerifyParam implements NoParam {
  final String channel;
  final String countryDialCode;
  final String to;
  final String otp;

  OTPVerifyParam({required this.channel,required  this.countryDialCode,required this.to,required this.otp});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => true;

}