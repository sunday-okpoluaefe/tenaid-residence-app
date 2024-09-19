part of 'edit_profile_screen_bloc.dart';

sealed class EditProfileScreenEvent extends Equatable {
  const EditProfileScreenEvent();
}

class OnLoadAccount extends EditProfileScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnFirstNameChanged extends EditProfileScreenEvent {
  final String name;

  OnFirstNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnLastNameChanged extends EditProfileScreenEvent {
  final String name;

  OnLastNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnDobChanged extends EditProfileScreenEvent {
  final DateTime dob;

  OnDobChanged(this.dob);

  @override
  List<Object?> get props => [dob];
}

class OnCountryChanged extends EditProfileScreenEvent {
  final CountryDomain country;

  OnCountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}

class OnPhotoAdded extends EditProfileScreenEvent {
  final String path;

  OnPhotoAdded(this.path);

  @override
  List<Object?> get props => [path];
}

class OnPhoneChanged extends EditProfileScreenEvent {
  final String phone;

  OnPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class OnContinueClicked extends EditProfileScreenEvent {
  @override
  List<Object?> get props => [];
}
