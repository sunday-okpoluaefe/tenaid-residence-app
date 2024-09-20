import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_community_param.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/use_cases/create_community_usecase.dart';
import '../../../../library/core/domain/use_cases/upload_multiple_files_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'confirm_create_bloc.g.dart';
part 'confirm_create_event.dart';
part 'confirm_create_state.dart';

@injectable
class ConfirmCreateBloc
    extends AppBloc<ConfirmCreateEvent, ConfirmCreateState> {
  final UploadMultipleFilesUseCase uploadMultipleFiles;
  final CreateCommunityUseCase createCommunity;

  ConfirmCreateBloc(this.uploadMultipleFiles, this.createCommunity)
      : super(ConfirmCreateState()) {
    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        List<String> images =
            await uploadMultipleFiles(state.param?.images ?? []);

        CreateCommunityParam param = state.param!.copyWith(images: images);
        await createCommunity(param);

        emit(state.copyWith(loading: false, completed: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(error: Resettable(error), loading: false));
      }
    });

    on<OnInit>((event, emit) async {
      emit(state.copyWith(param: event.param));
    });
  }
}
