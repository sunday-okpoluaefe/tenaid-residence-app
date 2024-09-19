import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/entity/login_param.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../../../../core/network/api_error_parser.dart';
import '../../../../library/account/domain/use_cases/login_usecase.dart';

part 'login_screen_bloc.g.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

@injectable
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final LoginUseCase _login;

  String _emailAddress = '';
  String _password = '';

  void handleUiEvent(LoginScreenEvent event) => add(event);

  bool validateInput() =>
      (_emailAddress.isValidEmail && _password.isNotEmpty) ? true : false;

  LoginScreenBloc(this._login)
      : super(LoginScreenState(
            errorMessage: Resettable(), signInComplete: Resettable())) {
    on<OnEmailChanged>((event, emit) {
      _emailAddress = event.email;
      emit(state.copyWith(canContinue: validateInput()));
    });

    on<OnPasswordChanged>((event, emit) {
      _password = event.password;
      emit(state.copyWith(canContinue: validateInput()));
    });

    on<OnEmailFocusChanged>((event, emit) {
      emit(state.copyWith(
          emailValidationError: !_emailAddress.isValidEmail &&
              _emailAddress.isNotEmpty &&
              !event.hasFocus));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        await _login(
            LoginParam(username: _emailAddress.trim(), password: _password));
        emit(state.copyWith(loading: false, signInComplete: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, errorMessage: Resettable(error)));
      }
    });
  }
}
