import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/chip_group.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/image_view.dart';
import '../../../ds/component/phone_field.dart';
import '../../home/bloc/home_screen_bloc.dart';

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality, int? limit);

class EditProfileScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EditProfileScreen> {
  final EditProfileScreenBloc bloc = GetIt.instance.get();
  final AccountNavigator navigator = GetIt.instance.get();

  final TextEditingController dobController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? imagePath;

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnLoadAccount());
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, EditProfileScreenState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: state.initializing
                    ? PageLoader()
                    : _screen(context, state)),
          ),
      listener: (_, EditProfileScreenState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.showProfile?.get() == true) {
          widget.showSuccessMessage(
              message: 'Your profile has been updated successfully',
              title: 'Profile updated',
              onDismiss: () {
                context
                    .read<HomeScreenBloc>()
                    .handleUiEvent(OnGetProfilePhoto());
                navigator.back();
              });
        }
      });

  Widget _screen(BuildContext context, EditProfileScreenState state) =>
      AppScrollView(
          bottom: PrimaryButton(
              title: 'Continue',
              enabled: state.validated,
              loading: state.loading,
              modifier: EdgeInsets.symmetric(
                  horizontal: Spacing.small_w, vertical: Spacing.small_h),
              onClick: () => bloc.handleUiEvent(OnContinueClicked())),
          body: Padding(
            padding:
                EdgeInsets.only(left: Spacing.small_w, right: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: 'Edit profile',
                  description: 'Update your profile information',
                  bottom: Spacing.medium_h,
                ),
                Stack(
                  children: [
                    ImageView(
                      url: state.account?.photo ?? "",
                      path: imagePath,
                      size: IconSize.extraLargeProfile,
                      shape: Shape.Circle,
                      fallBackImage: Assets.manAvatar.svg(),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            if (mounted) {
                              _picker
                                  .pickMedia(
                                maxWidth: 512,
                                maxHeight: 512,
                                imageQuality: 100,
                              )
                                  .then((XFile? file) {
                                if (file != null) {
                                  final String? mime =
                                      lookupMimeType(file.path);
                                  if (mime == null ||
                                      mime.startsWith('image/')) {
                                    setState(() {
                                      imagePath = file.path;
                                      bloc.handleUiEvent(
                                          OnPhotoAdded(file.path));
                                    });
                                  }
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Spacing.extraExtraSmall_w,
                                vertical: Spacing.extraExtraSmall_h),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.color.surfaceContainer),
                            child: Assets.edit
                                .svg(color: context.color.surfaceTint),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: Spacing.extraLarge_h,
                ),
                TTextField(
                  label: 'Email address',
                  enable: false,
                  inputType: TextInputType.emailAddress,
                  initialValue: state.account?.email?.value ?? "",
                  prefixIcon: Assets.sms.svg(fit: BoxFit.scaleDown),
                  readOnly: true,
                ),
                SizedBox(height: Spacing.small_h),
                TTextField(
                  label: 'First name',
                  onChanged: (s) => bloc.handleUiEvent(OnFirstNameChanged(s)),
                  initialValue: state.account?.firstName ?? "",
                  prefixIcon: Assets.profile.svg(fit: BoxFit.scaleDown),
                ),
                SizedBox(height: Spacing.small_h),
                TTextField(
                  label: 'Last name',
                  onChanged: (s) => bloc.handleUiEvent(OnLastNameChanged(s)),
                  initialValue: state.account?.lastName ?? "",
                  prefixIcon: Assets.profile.svg(fit: BoxFit.scaleDown),
                ),
                SizedBox(height: Spacing.small_h),
                TTextField(
                  label: 'Date of birth',
                  initialValue: state.account?.dob != null
                      ? DateTime.parse(state.account!.dob!)
                          .toFormat(DATE_FORMAT)
                      : "",
                  prefixIcon: Assets.calendar.svg(fit: BoxFit.scaleDown),
                  controller: dobController,
                  readOnly: true,
                  onTap: () {
                    DateTime _18yrs =
                        DateTime.now().subtract(Duration(days: 6935));

                    showDatePicker(
                            context: context,
                            initialDate: _18yrs,
                            firstDate: DateTime(1900),
                            lastDate: _18yrs)
                        .then((dt) {
                      if (dt != null) {
                        dobController.text = dt.toFormat(DATE_FORMAT);
                        bloc.handleUiEvent(OnDobChanged(dt));
                      }
                    });
                  },
                  suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown),
                ),
                SizedBox(height: Spacing.small_h),
                PhoneField(
                  label: context.locale.phone_number,
                  initialValue: state.account?.phone ?? "",
                  defaultCountry: state.selectedCountry,
                  onChanged: (s) => bloc.handleUiEvent(OnPhoneChanged(s)),
                  onCountrySelected: (country) =>
                      bloc.handleUiEvent(OnCountryChanged(country)),
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gender',
                      style: context.text.titleMedium,
                    ),
                    ChipGroup(
                      choices: ['Male', 'Female'],
                      defaultSelected: state.gender,
                      onSelectedChanged: (String choice) =>
                          bloc.handleUiEvent(OnGenderChanged(choice)),
                    )
                  ],
                )
              ],
            ),
          ));
}
