part of 'select_street_screen_bloc.dart';

sealed class SelectStreetScreenEvent extends Equatable {
  const SelectStreetScreenEvent();
}

class OnGetStreets extends SelectStreetScreenEvent {
  final String community;

  OnGetStreets(this.community);

  @override
  List<Object?> get props => [];
}

class OnStreetSelected extends SelectStreetScreenEvent {
  final StreetDomain street;

  OnStreetSelected(this.street);

  @override
  List<Object?> get props => [street];
}
