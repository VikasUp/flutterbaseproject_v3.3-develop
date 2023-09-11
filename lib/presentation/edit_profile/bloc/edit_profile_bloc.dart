
import 'package:bloc/bloc.dart';
import 'package:base_project/core/util/utilities.dart';
import 'package:base_project/domain/usecases/update_profile.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UpdateProfile updateProfile;

  EditProfileBloc(this.updateProfile) : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) async {
      emit(EditProfileLoading());
    });
    on<EditProfilePressed>((event, emit) async {
      emit(EditProfileLoading());
      final param = UpdateProfileParams(event.firstName, event.lastName,
          event.email, event.phoneNumber, event.countryCode, event.authToken);
      final result = await updateProfile(param);
      result.fold((failure) async {
        Utilities.addLogOnFailure(failure);
        emit(EditProfileFailure(
          error: failure.toString(),
        ));
      }, (success) async {
        emit(EditProfileSuccess());
      });
    });
  }
}
