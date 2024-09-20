import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_image/bloc/community_image_bloc.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_community_param.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/linear_progress_indicator.dart';
import 'components/community_images_holder.dart';

class CommunityImageScreen extends StatefulWidget {
  final CreateCommunityParam param;

  const CommunityImageScreen({super.key, required this.param});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommunityImageScreen> {
  final CommunityImageBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage() async {
    if (mounted) {
      XFile? file = await _picker.pickMedia(
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 100,
      );

      if (file != null) {
        final String? mime = lookupMimeType(file.path);
        return (mime == null || mime.startsWith('image/')) ? file.path : null;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CommunityImageState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, CommunityImageState state) {});

  Widget _screen(BuildContext context, CommunityImageState state) =>
      AppScrollView(
          top: TLinearProgressIndicator(steps: 4, current: 3),
          bottom: PrimaryButton(
              modifier: EdgeInsets.all(Spacing.small),
              enabled: state.images.isNotEmpty,
              title: context.locale.continue_button,
              onClick: () => navigator.toCommunityConfirmCreate(
                  param: widget.param.copyWith(images: state.images))),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PageHeader(
                      title: 'Upload photos',
                      description:
                          'Upload at least a photo or logo of your community.',
                      top: Spacing.extraSmall,
                      bottom: Spacing.medium,
                    )
                  ],
                ),
                CommunityImagesHolder(
                  onEditItem: (x) {
                    pickImage().then((String? file) {
                      if (file != null) {
                        bloc.handleUiEvent(OnEditImage(path: file, index: x));
                      }
                    });
                  },
                  onItemClicked: (x) {
                    pickImage().then((String? file) {
                      if (file != null) {
                        bloc.handleUiEvent(OnImageAdded(file));
                      }
                    });
                  },
                  onRemoveItem: (x) => bloc.handleUiEvent(OnRemoveImage(x)),
                  images: state.images,
                )
              ],
            ),
          ));
}
