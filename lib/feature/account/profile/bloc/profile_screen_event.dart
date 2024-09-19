part of 'profile_screen_bloc.dart';

sealed class ProfileScreenEvent extends Equatable {
  const ProfileScreenEvent();
}

class OnFetchProfile extends ProfileScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnLogout extends ProfileScreenEvent {
  @override
  List<Object?> get props => [];
}
