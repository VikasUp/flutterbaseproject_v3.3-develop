import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/register_with_otp_repository.dart';
import '/domain/entities/otp_sent.dart';
import 'package:dartz/dartz.dart';

class SendOTP implements UseCase<OTPSent, SendOTPParam> {
  final RegisterWithOTPRepository repository;

  SendOTP(this.repository);

  @override
  Future<Either<Failure, OTPSent>> call(SendOTPParam params) async{
    return await repository.sendOTP(params.channel, params.to, params.countryCode);
  }

}

class SendOTPParam implements NoParam {
  final String channel;
  final String to;
  final String? countryCode;

  SendOTPParam({required this.channel,required this.to, this.countryCode});

  @override
  List<Object?> get props => [channel, to];

  @override
  bool? get stringify => true;

}