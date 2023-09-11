part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegisterButtonPressed extends RegistrationEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String userName;
  final BuildContext context;
  final bool status;
  final int? phoneNumber;

  const RegisterButtonPressed({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.userName,
    required this.context,
    required this.status,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        password,
        userName,
        status,
        phoneNumber,
      ];
}


