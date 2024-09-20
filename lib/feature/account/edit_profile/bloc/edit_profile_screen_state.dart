part of 'edit_profile_screen_bloc.dart';

@CopyWith(skipFields: true)
class EditProfileScreenState extends Equatable {
  final bool loading;
  final bool initializing;
  final bool validated;
  final Country? selectedCountry;
  final AccountDomain? account;
  final Resettable<ApiException>? error;
  final Resettable<bool>? showProfile;

  EditProfileScreenState(
      {this.loading = false,
      this.error,
      this.selectedCountry,
      this.initializing = true,
      this.showProfile,
      this.account,
      this.validated = false});

  @override
  List<Object?> get props => [
        initializing,
        selectedCountry,
        loading,
        showProfile,
        error,
        account,
        validated
      ];
}
