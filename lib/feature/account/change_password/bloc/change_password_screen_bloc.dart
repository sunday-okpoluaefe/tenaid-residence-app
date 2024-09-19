import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/change_password_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../utils/app_bloc.dart';

part 'change_password_screen_bloc.g.dart';
part 'change_password_screen_event.dart';
part 'change_password_screen_state.dart';

@injectable
class ChangePasswordScreenBloc
    extends AppBloc<ChangePasswordScreenEvent, ChangePasswordScreenState> {
  String password = "";
  String confirmPassword = "";

  final ChangePasswordUseCase changePassword;

  bool get isValid {
    return password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }

  ChangePasswordScreenBloc(this.changePassword)
      : super(ChangePasswordScreenState()) {
    on<OnPasswordChanged>((event, emit) {
      password = event.password;
      emit(state.copyWith(validated: isValid));
    });

    on<OnConfirmPasswordChanged>((event, emit) {
      confirmPassword = event.password;
      emit(state.copyWith(
          validated: isValid,
          isValidConfirm: (password == confirmPassword) ||
              password.isEmpty ||
              confirmPassword.isEmpty));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        await changePassword(password);
        emit(state.copyWith(loading: false, isComplete: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
