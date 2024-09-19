import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

part 'member_address_screen_bloc.g.dart';
part 'member_address_screen_event.dart';
part 'member_address_screen_state.dart';

@injectable
class MemberAddressScreenBloc
    extends Bloc<MemberAddressScreenEvent, MemberAddressScreenState> {
  StreetDomain? _selectedStreet;
  String? _apartment;
  String? _houseNumber;

  void handleUiEvent(MemberAddressScreenEvent event) => add(event);

  bool _isValidated() =>
      _selectedStreet != null &&
      _houseNumber != null &&
      _apartment?.isNotEmpty == true;

  MemberAddressScreenBloc() : super(MemberAddressScreenState()) {
    on<OnStreetSelected>((event, emit) {
      _selectedStreet = event.street;
      emit(state.copyWith(
          selectedStreet: event.street, validated: _isValidated()));
    });

    on<OnApartmentChanged>((event, emit) {
      _apartment = event.apartment;
      emit(state.copyWith(validated: _isValidated()));
    });

    on<OnContinueClicked>((event, emit) {
      emit(state.copyWith(
          houseNumber: _houseNumber,
          apartment: _apartment,
          showConfirmScreen: Resettable(true)));
    });

    on<OnHouseNumberChanged>((event, emit) {
      _houseNumber = event.number;
      emit(state.copyWith(validated: _isValidated()));
    });
  }
}
