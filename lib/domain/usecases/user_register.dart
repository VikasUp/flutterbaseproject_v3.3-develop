
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';

class UserRegister implements UseCase<bool, UserRegisterParam> {
  final RegistrationRepository repository;

  UserRegister(this.repository);

  @override
  Future<Either<Failure, bool>> call(UserRegisterParam params) async {
    return await repository.userRegister(params.email, params.password, params.firstName, params.lastName, params.userName, params.phoneNumber);
  }
}

class UserRegisterParam implements NoParam {

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String userName;
  final int? phoneNumber;

  UserRegisterParam(this.email, this.password, this.firstName, this.lastName, this.userName, this.phoneNumber);

  @override
  List<Object?> get props => [email, password, firstName, lastName, userName, phoneNumber];

  @override
  bool? get stringify => true;

}