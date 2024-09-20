import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/entity/login_param.dart';
import 'package:tenaid_mobile/library/account/domain/entity/signup_param.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/login_usecase.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/signup_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../../../../utils/country_utils/models/country.dart';

part 'signup_screen_bloc.g.dart';
part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

//ngn._("Nigerian Naira", "NGN", "₦"),

Country defaultCountry = Country(
    name: 'Nigeria',
    isoCode: 'NG',
    phoneCode: '+234',
    flag: '🇳🇬',
    latitude: '',
    longitude: '',
    currency: 'NGN');

extension SignupValidation on SignUpParam {
  bool get isValidated {
    return firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isValidEmail &&
        phone.isNotEmpty &&
        password.isNotEmpty;
  }
}

@injectable
class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  final SignUpUseCase _signUp;
  final LoginUseCase _login;

  SignUpParam _param = SignUpParam(country: defaultCountry);

  void handleUiEvent(SignupScreenEvent event) => add(event);

  SignupScreenBloc(this._signUp, this._login)
      : super(SignupScreenState(
            signUpComplete: Resettable(false),
            errorMessage: Resettable(),
            selectedCountry: defaultCountry)) {
    on<OnFNameChanged>((event, emit) {
      _param = _param.copyWith(firstName: event.name);
      emit(state.copyWith(validated: _param.isValidated));
    });

    on<OnLNameChanged>((event, emit) {
      _param = _param.copyWith(lastName: event.name);
      emit(state.copyWith(validated: _param.isValidated));
    });

    on<OnEmailFocusChanged>((event, emit) {
      emit(state.copyWith(
          emailValidationError: !_param.email.isValidEmail &&
              !event.hasFocus &&
              _param.email.isNotEmpty));
    });

    on<OnEmailNameChanged>((event, emit) {
      _param = _param.copyWith(email: event.email);
      emit(state.copyWith(validated: _param.isValidated));
    });

    on<OnPhoneNameChanged>((event, emit) {
      _param = _param.copyWith(phone: event.phone);
      emit(state.copyWith(validated: _param.isValidated));
    });

    on<OnPasswordNameChanged>((event, emit) {
      _param = _param.copyWith(password: event.password);
      emit(state.copyWith(validated: _param.isValidated));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        await _signUp(_param);
        await _login(
            LoginParam(username: _param.email, password: _param.password));
        emit(state.copyWith(signUpComplete: Resettable(true), loading: false));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, errorMessage: Resettable(error)));
      }
    });

    on<OnCountryChanged>((event, emit) {
      _param = _param.copyWith(country: event.country);
      emit(state.copyWith(selectedCountry: event.country));
    });
  }
}
