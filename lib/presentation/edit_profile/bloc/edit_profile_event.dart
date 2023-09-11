part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class EditProfilePressed extends EditProfileEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? phoneNumber;
  final String? countryCode;
  final String? authToken;

  const EditProfilePressed({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.countryCode,
    this.phoneNumber,
    this.authToken,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        countryCode,
    authToken,
      ];
}
