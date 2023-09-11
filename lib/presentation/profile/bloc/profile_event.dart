import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileGetUserEvent extends ProfileEvent {
  const ProfileGetUserEvent();

  @override
  String toString() => 'getting user list';
}



