import 'package:base_project/core/usecase/usecase.dart';
import 'package:base_project/domain/usecases/clear_token.dart';
import 'package:base_project/domain/usecases/get_token.dart';
import 'package:base_project/domain/usecases/store_token.dart';
import 'package:bloc/bloc.dart';

import 'authentication.dart';

const String token = "token";

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ClearToken clearToken;
  final GetToken getToken;
  final StoreToken storeToken;

  AuthenticationBloc({
    required this.clearToken,
    required this.getToken,
    required this.storeToken,
  }) : super(AuthenticationUninitialized()) {
    on<AppStarted>(onAppStarted);

    on<LoggedIn>(onLoggedIn);

    on<LoggedOut>(onLoggedOut);
  }

  Future<void> onLoggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await clearToken(NoParam());
    emit(LogoutSuccess());
  }

  Future<void> onLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    await storeToken(TokenParam(event.token));
    emit(AuthenticationAuthenticated());
  }

  Future<void> onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final result = await getToken(NoParam());
    result.fold((failure) {
      emit(AuthenticationUnauthenticated());
    }, (token) async {
      emit(AuthenticationAuthenticated());
    });
  }
}
