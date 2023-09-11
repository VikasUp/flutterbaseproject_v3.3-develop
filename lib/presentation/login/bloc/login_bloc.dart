import 'package:base_project/core/constant/enums.dart';
import 'package:base_project/core/firebase/firebase_util.dart';
import 'package:base_project/core/util/utilities.dart';
import 'package:bloc/bloc.dart';

import '/core/error/exception.dart';
import '/domain/usecases/login_user.dart';
import '/presentation/authentication/bloc/authentication.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final LoginUser loginUser;

  LoginBloc({required this.authenticationBloc, required this.loginUser})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(doLogin);
  }

  Future<void> doLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final param = LoginUserParam(event.username, event.password);
    final result = await loginUser(param);

    result.fold((failure) {
      Utilities.addLogOnFailure(failure);
      emit(LoginFailure(error: failure.message));

      emit(LoginInitial());
    }, (token) async {
      authenticationBloc.add(
        LoggedIn(token: token),
      );
      emit(LoginSuccess());
    });
  }
}
