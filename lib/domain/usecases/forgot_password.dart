

import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/forgot_password_repsitory.dart';
import 'package:dartz/dartz.dart';

class ForgotPassword implements UseCase<bool, ForgotPasswordParam> {
  final ForgotPasswordRepository repository;

  ForgotPassword(this.repository);

  @override
  Future<Either<Failure, bool>> call(ForgotPasswordParam params) async{
    return await repository.forgotPassword(params.email);
  }
}

class ForgotPasswordParam implements NoParam {
  final String email;

  ForgotPasswordParam(this.email);

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => true;

}