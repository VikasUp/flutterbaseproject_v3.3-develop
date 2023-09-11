import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetUserPaginatedEvent extends HomeEvent {
  final bool isLoadMore;
  const HomeGetUserPaginatedEvent({required this.isLoadMore});

  @override
  String toString() => 'getting paginated user list';
}

class LogoutPressed extends HomeEvent {
  @override
  String toString() => 'logout click';
}
