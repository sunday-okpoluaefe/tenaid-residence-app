part of 'select_street_screen_bloc.dart';

sealed class SelectStreetScreenEvent extends Equatable {
  const SelectStreetScreenEvent();
}

class OnGetStreets extends SelectStreetScreenEvent {
  final String community;
  final int page;
  final int limit;

  OnGetStreets(
      {required this.community, required this.page, required this.limit});

  @override
  List<Object?> get props => [community, page, limit];
}

class OnStreetSelected extends SelectStreetScreenEvent {
  final StreetDomain street;

  OnStreetSelected(this.street);

  @override
  List<Object?> get props => [street];
}
