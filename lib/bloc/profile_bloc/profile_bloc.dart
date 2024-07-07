import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_project_team_7/model/profile_model.dart';
import 'package:mini_project_team_7/services/repository/profile_repository.dart';
import 'package:meta/meta.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(ProfileInitialState()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final profile = await profileRepository.fetchProfile();
        emit(ProfileLoadedState(profile: profile));
      } catch (e) {
        emit(ProfileErrorState());
      }
    });
  }
}
