part of 'member_address_screen_bloc.dart';

sealed class MemberAddressScreenEvent extends Equatable {
  const MemberAddressScreenEvent();
}

class OnStreetSelected extends MemberAddressScreenEvent {
  final StreetDomain street;

  OnStreetSelected(this.street);

  @override
  List<Object?> get props => [street];
}

class OnHouseNumberChanged extends MemberAddressScreenEvent {
  final String number;

  OnHouseNumberChanged(this.number);

  @override
  List<Object?> get props => [number];
}

class OnApartmentChanged extends MemberAddressScreenEvent {
  final String apartment;

  OnApartmentChanged(this.apartment);

  @override
  List<Object?> get props => [];
}

class OnContinueClicked extends MemberAddressScreenEvent {
  @override
  List<Object?> get props => [];
}
