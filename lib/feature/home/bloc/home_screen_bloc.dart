import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../utils/app_bloc.dart';

part 'home_screen_bloc.g.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

@injectable
class HomeScreenBloc extends AppBloc<HomeScreenEvent, HomeScreenState> {
  final GetAccountUseCase getAccount;

  HomeScreenBloc(this.getAccount) : super(const HomeScreenState()) {
    on<OnPageSelected>((event, emit) {
      emit(state.copyWith(selectedPage: event.page));
    });

    on<OnGetProfilePhoto>((event, emit) async {
      try {
        AccountDomain? account = await getAccount(false);
        emit(state.copyWith(profilePhoto: account.photo));
      } catch (_) {}
    });

    on<OnCheckPermission>((event, emit) async {
      bool granted = await Permission.notification.status.isGranted;
      emit(state.copyWith(notificationGranted: granted));
    });
  }
}
