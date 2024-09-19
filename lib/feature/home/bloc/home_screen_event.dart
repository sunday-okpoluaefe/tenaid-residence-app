part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class OnPageSelected extends HomeScreenEvent {
  final int page;

  OnPageSelected(this.page);

  @override
  List<Object?> get props => [page];
}

class OnGetProfilePhoto extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnCheckPermission extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}
