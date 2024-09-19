part of 'member_address_screen_bloc.dart';

@CopyWith(skipFields: true)
class MemberAddressScreenState extends Equatable {
  final StreetDomain? selectedStreet;
  final bool validated;
  final String? houseNumber;
  final String? apartment;
  final Resettable<bool>? showConfirmScreen;

  const MemberAddressScreenState(
      {this.selectedStreet,
      this.validated = false,
      this.apartment,
      this.houseNumber,
      this.showConfirmScreen});

  @override
  List<Object?> get props =>
      [selectedStreet, validated, houseNumber, apartment, showConfirmScreen];
}
