import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/app_bloc.dart';

part 'community_image_bloc.g.dart';
part 'community_image_event.dart';
part 'community_image_state.dart';

@injectable
class CommunityImageBloc
    extends AppBloc<CommunityImageEvent, CommunityImageState> {
  CommunityImageBloc() : super(CommunityImageState()) {
    on<OnImageAdded>((event, emit) {
      List<String> images = state.images.toList();
      images.add(event.path);
      emit(state.copyWith(images: images));
    });

    on<OnEditImage>((event, emit) {
      List<String> images = state.images.toList();
      images[event.index] = event.path;
      emit(state.copyWith(images: images));
    });

    on<OnRemoveImage>((event, emit) {
      List<String> images = state.images.toList();
      images.removeAt(event.index);
      emit(state.copyWith(images: images));
    });
  }
}
