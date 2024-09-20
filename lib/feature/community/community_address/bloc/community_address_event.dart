part of 'community_address_bloc.dart';

sealed class CommunityAddressEvent extends Equatable {
  const CommunityAddressEvent();
}

class OnAddressChanged extends CommunityAddressEvent {
  final PlaceDomain place;

  OnAddressChanged(this.place);

  @override
  List<Object?> get props => [place];
}

class OnCountrySelected extends CommunityAddressEvent {
  final Country country;

  OnCountrySelected(this.country);

  @override
  List<Object?> get props => [country];
}

class OnCitySelected extends CommunityAddressEvent {
  final City city;

  OnCitySelected(this.city);

  @override
  List<Object?> get props => [city];
}
