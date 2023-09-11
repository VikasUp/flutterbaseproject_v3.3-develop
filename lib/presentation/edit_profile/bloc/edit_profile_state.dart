part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final String error;

  const EditProfileFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'EditProfileFailure { error: $error }';
}
