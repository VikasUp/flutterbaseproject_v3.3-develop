
import '/core/error/exception.dart';
import '/core/usecase/usecase.dart';
import '/data/repositories/edit_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfile implements UseCase<bool, UpdateProfileParams> {
  final EditProfileRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params.firstName, params.lastName, params.email, params.phoneNumber, params.countryCode, params.authToken);
  }

}

class UpdateProfileParams implements NoParam {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? phoneNumber;
  final String? countryCode;
  final String? authToken;

  UpdateProfileParams(this.firstName, this.lastName, this.email, this.phoneNumber, this.countryCode, this.authToken);

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber, countryCode];

  @override
  bool? get stringify => true;

}