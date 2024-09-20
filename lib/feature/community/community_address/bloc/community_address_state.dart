part of 'community_address_bloc.dart';

@CopyWith(skipFields: true)
class CommunityAddressState extends Equatable {
  final Country? selectedCountry;
  final City? selectedCity;
  final PlaceDomain? place;

  AddressDomain get address => AddressDomain(
      address: place!.address!,
      city: selectedCity!.name,
      country: selectedCountry!.name,
      longitude: place?.longitude!.toString(),
      latitude: place?.latitude!.toString(),
      postalCode: '',
      proofOfAddress: '');

  CommunityAddressState({this.selectedCountry, this.selectedCity, this.place});

  @override
  List<Object?> get props => [selectedCountry, selectedCity, place];
}
