part of 'home_screen_bloc.dart';

@CopyWith(skipFields: true)
class HomeScreenState extends Equatable {
  final int selectedPage;
  final bool notificationGranted;
  final Resettable<bool>? requestPermission;
  final String? profilePhoto;

  const HomeScreenState(
      {this.notificationGranted = true,
      this.selectedPage = 0,
      this.requestPermission,
      this.profilePhoto});

  @override
  List<Object?> get props =>
      [requestPermission, selectedPage, profilePhoto, notificationGranted];
}
