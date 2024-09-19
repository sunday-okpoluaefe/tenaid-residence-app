import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:phonecodes/phonecodes.dart' as phone_codes;
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/country_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/update_profile_info_param.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/update_info_usecase.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/upload_file_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/phone_codes_country_xts.dart';

import '../../../../utils/app_bloc.dart';

part 'edit_profile_screen_bloc.g.dart';

part 'edit_profile_screen_event.dart';

part 'edit_profile_screen_state.dart';

@injectable
class EditProfileScreenBloc
    extends AppBloc<EditProfileScreenEvent, EditProfileScreenState> {
  final GetAccountUseCase getAccount;
  final UploadFileUseCase uploadFile;
  final UpdateInfoUseCase updateInfo;

  String fName = '';
  String lName = '';
  DateTime? dob;
  String phone = '';
  String imageUrl = '';
  String imagePath = '';
  late CountryDomain selectedCountry;

  bool get validated =>
      fName.isNotEmpty && lName.isNotEmpty && dob != null && phone.isNotEmpty;

  EditProfileScreenBloc(this.getAccount, this.uploadFile, this.updateInfo)
      : super(EditProfileScreenState()) {
    on<OnFirstNameChanged>((event, emit) async {
      fName = event.name;
      emit(state.copyWith(validated: validated));
    });

    on<OnLastNameChanged>((event, emit) async {
      lName = event.name;
      emit(state.copyWith(validated: validated));
    });

    on<OnPhotoAdded>((event, emit) async {
      imagePath = event.path;
      emit(state.copyWith(validated: validated));
    });

    on<OnDobChanged>((event, emit) async {
      dob = event.dob;
      emit(state.copyWith(validated: validated));
    });

    on<OnCountryChanged>((event, emit) async {
      selectedCountry = event.country;
      emit(state.copyWith(validated: validated));
    });

    on<OnPhoneChanged>((event, emit) async {
      phone = event.phone;
      emit(state.copyWith(validated: validated));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        if (imagePath.isNotEmpty) {
          imageUrl = await uploadFile(imagePath);
        }
        await updateInfo(UpdateProfileInfoParam(
            firstName: fName,
            lastName: lName,
            photo: imageUrl,
            phone: phone,
            country: selectedCountry.name,
            dob: dob!.toFormat(DATETIME_FORMAT)));

        emit(state.copyWith(loading: false, showProfile: Resettable(true)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });

    on<OnLoadAccount>((event, emit) async {
      emit(state.copyWith(initializing: true));

      try {
        AccountDomain account = await getAccount(false);
        fName = account.firstName ?? "";
        lName = account.lastName ?? "";
        imageUrl = account.photo ?? '';

        if (account.country != null && account.phone != null) {
          selectedCountry =
              phone_codes.Countries.findByName(account.country!).toDomain();
          phone = account.phone!.replaceFirst(selectedCountry.dialCode, '0');

          account = account.copyWith(phone: phone);
        }

        if (account.dob != null) dob = DateTime.parse(account.dob!);

        emit(state.copyWith(
            account: account,
            initializing: false,
            selectedCountry: selectedCountry));
      } catch (_) {}
    });
  }
}
