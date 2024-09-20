import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/entity/address_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/country_utils/country_utils.dart';
import 'package:tenaid_mobile/utils/country_utils/models/city.dart';

import '../../../../utils/app_bloc.dart';

part 'community_address_bloc.g.dart';
part 'community_address_event.dart';
part 'community_address_state.dart';

@injectable
class CommunityAddressBloc
    extends AppBloc<CommunityAddressEvent, CommunityAddressState> {
  CommunityAddressBloc() : super(CommunityAddressState()) {
    on<OnAddressChanged>((event, emit) {
      emit(state.copyWith(place: event.place));
    });

    on<OnCitySelected>((event, emit) {
      emit(state.copyWith(selectedCity: event.city));
    });

    on<OnCountrySelected>((event, emit) {
      emit(state.copyWith(selectedCountry: event.country));
    });
  }
}
