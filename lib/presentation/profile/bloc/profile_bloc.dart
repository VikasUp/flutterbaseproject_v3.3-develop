import 'dart:async';

import 'package:base_project/core/constant/strings.dart';
import 'package:base_project/core/util/utilities.dart';
import 'package:base_project/domain/usecases/fetch_user_listing.dart';
import 'package:base_project/presentation/profile/bloc/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserListing fetchUserListing;
  ProfileBloc({
    required this.fetchUserListing,
  }) : super(ProfileInitialState()) {
    on<ProfileGetUserEvent>(onProfileGetUserEvent);
  }

  FutureOr<void> onProfileGetUserEvent(
      ProfileGetUserEvent event, Emitter<ProfileState> emit) async {
    var params = FetchUserListingParam(0, 25);
    final result = await fetchUserListing(params);

    result.fold((failure) async {
      Utilities.addLogOnFailure(failure);
      emit(ProfileGetUserListFail(error: failure.toString()));
      emit(ProfileInitialState());
    }, (response) async {
      if (response.content?.isNotEmpty ?? false) {
        emit(ProfileGetUserListSuccess(userList: response.content ?? []));
      } else {
        emit(ProfileGetUserListFail(
            error: SFLStrings.message.kSomethingWentWrong));
      }
    });
  }
}
