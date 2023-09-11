import 'package:equatable/equatable.dart';
import '/domain/entities/index.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeGetUserListSuccess extends HomeState {
  final List<User> userList;
  final int currentPage;

  const HomeGetUserListSuccess({required this.userList, required this.currentPage});

  @override
  List<Object> get props => [userList, currentPage];

  @override
  String toString() => 'Home User list';
}


class HomeGetUserListFail extends HomeState {
  final String error;

  const HomeGetUserListFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeFailure { error: $error }';
}
