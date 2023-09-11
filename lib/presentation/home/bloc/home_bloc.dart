import 'dart:async';

import 'package:base_project/core/util/utilities.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/usecases/get_user.dart';
import 'package:base_project/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:base_project/presentation/authentication/bloc/authentication_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc authenticationBloc;
  final GetUser getUser;

  List<User> userList = [];
  int _currentPage = 0;
  bool hasMaxReached = false;

  HomeBloc({required this.authenticationBloc, required this.getUser})
      : super(HomeStateInitial()) {
    on<HomeGetUserPaginatedEvent>(onHomeGetUserPaginatedEvent);
    on<LogoutPressed>(onLogoutPressed);
  }

  HomeState get initialState => HomeStateInitial();

  Future<void> onHomeGetUserPaginatedEvent(
      HomeGetUserPaginatedEvent event, Emitter<HomeState> emit) async {
    if (!event.isLoadMore) {
      _currentPage = 0;
      hasMaxReached = false;
    }
    if (!hasMaxReached) {
      if (_currentPage == 0 && !event.isLoadMore) {
        emit(HomeStateLoading());
      }
      final result = await getUser(GetUserParam(_currentPage));
      result.fold((failure) async {
        Utilities.addLogOnFailure(failure);
        emit(HomeGetUserListFail(error: failure.message));
        emit(HomeStateInitial());
      }, (response) async {
        if (!event.isLoadMore) {
          userList.clear();
        }
        userList.addAll(response.content ?? []);
        hasMaxReached = response.last ?? true;
        if (!hasMaxReached) {
          _currentPage += 1;
        }
        emit(HomeStateInitial()); //as same state being emit as previous, in
        emit(HomeGetUserListSuccess(
            userList: userList, currentPage: _currentPage));
      });
    }
  }

  FutureOr<void> onLogoutPressed(LogoutPressed event, Emitter<HomeState> emit) {
    authenticationBloc.add(LoggedOut());
  }
}
