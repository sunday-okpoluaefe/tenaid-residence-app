// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api.dart' as _i30;
import '../core/network/network_interceptor.dart' as _i18;
import '../feature/account/account_navigator.dart' as _i3;
import '../feature/account/change_password/bloc/change_password_screen_bloc.dart'
    as _i74;
import '../feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart'
    as _i76;
import '../feature/account/login/bloc/login_screen_bloc.dart' as _i77;
import '../feature/account/profile/bloc/profile_screen_bloc.dart' as _i67;
import '../feature/account/signup/bloc/signup_screen_bloc.dart' as _i72;
import '../feature/community/community_address/bloc/community_address_bloc.dart'
    as _i8;
import '../feature/community/community_image/bloc/community_image_bloc.dart'
    as _i9;
import '../feature/community/community_navigator.dart' as _i11;
import '../feature/community/confirm_create/bloc/confirm_create_bloc.dart'
    as _i59;
import '../feature/community/confirm_join/bloc/confirm_join_screen_bloc.dart'
    as _i60;
import '../feature/community/create_community/bloc/create_community_bloc.dart'
    as _i13;
import '../feature/community/join_community/bloc/join_community_screen_bloc.dart'
    as _i15;
import '../feature/community/member_address/bloc/member_address_screen_bloc.dart'
    as _i16;
import '../feature/community/search_community/bloc/search_community_screen_bloc.dart'
    as _i69;
import '../feature/community/select_street/bloc/select_street_screen_bloc.dart'
    as _i50;
import '../feature/core/search_address/bloc/search_address_screen_bloc.dart'
    as _i68;
import '../feature/home/bloc/home_screen_bloc.dart' as _i62;
import '../feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart'
    as _i75;
import '../feature/home/pages/messages/bloc/message_screen_bloc.dart' as _i17;
import '../feature/home/pages/payments/bloc/payment_screen_bloc.dart' as _i21;
import '../feature/home/pages/visitors/bloc/visitor_screen_bloc.dart' as _i26;
import '../feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart'
    as _i54;
import '../feature/notification/bloc/notification_screen_bloc.dart' as _i46;
import '../feature/notification/notification_navigator.dart' as _i19;
import '../feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart'
    as _i14;
import '../feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart'
    as _i63;
import '../feature/visitor/visitor_navigator.dart' as _i25;
import '../library/account/data/account_repository_impl.dart' as _i57;
import '../library/account/data/data_source/account_local_datasource.dart'
    as _i29;
import '../library/account/data/data_source/account_remote_datasource.dart'
    as _i55;
import '../library/account/data/mapper/account_to_domain_mapper.dart' as _i4;
import '../library/account/domain/account_repository.dart' as _i56;
import '../library/account/domain/use_cases/change_password_usecase.dart'
    as _i58;
import '../library/account/domain/use_cases/get_account_usecase.dart' as _i61;
import '../library/account/domain/use_cases/islogin_usecase.dart' as _i64;
import '../library/account/domain/use_cases/login_usecase.dart' as _i65;
import '../library/account/domain/use_cases/logout_usecase.dart' as _i66;
import '../library/account/domain/use_cases/send_device_push_token_usecase.dart'
    as _i70;
import '../library/account/domain/use_cases/signup_usecase.dart' as _i71;
import '../library/account/domain/use_cases/update_info_usecase.dart' as _i73;
import '../library/community/data/community_repository_impl.dart' as _i33;
import '../library/community/data/data_source/community_local_datasource.dart'
    as _i10;
import '../library/community/data/data_source/community_remote_datasource.dart'
    as _i31;
import '../library/community/data/mapper/account_community_to_domain_mapper.dart'
    as _i28;
import '../library/community/data/mapper/community_to_domain_mapper.dart'
    as _i12;
import '../library/community/data/mapper/street_to_domain_mapper.dart' as _i23;
import '../library/community/data/mapper/visitor_to_domain_mapper.dart' as _i27;
import '../library/community/domain/community_repository.dart' as _i32;
import '../library/community/domain/entity/get_primary_account_community_usecase.dart'
    as _i41;
import '../library/community/domain/use_cases/create_community_usecase.dart'
    as _i36;
import '../library/community/domain/use_cases/get_all_communities_usecase.dart'
    as _i37;
import '../library/community/domain/use_cases/get_all_visitors_usecase.dart'
    as _i38;
import '../library/community/domain/use_cases/get_pending_visitors_usecase.dart'
    as _i40;
import '../library/community/domain/use_cases/get_recent_visitors_usecase.dart'
    as _i42;
import '../library/community/domain/use_cases/get_streets_usecase.dart' as _i43;
import '../library/community/domain/use_cases/get_today_visitors_usecase.dart'
    as _i44;
import '../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart'
    as _i45;
import '../library/community/domain/use_cases/request_join_usecase.dart'
    as _i47;
import '../library/community/domain/use_cases/search_community_usecase.dart'
    as _i49;
import '../library/community/domain/use_cases/send_invite_usecase.dart' as _i51;
import '../library/core/data/core_repository_impl.dart' as _i35;
import '../library/core/data/local_cache.dart' as _i7;
import '../library/core/data/mapper/notification_to_domain_mapper.dart' as _i20;
import '../library/core/data/mapper/place_to_domain_mapper.dart' as _i22;
import '../library/core/domain/cache.dart' as _i6;
import '../library/core/domain/core_repository.dart' as _i34;
import '../library/core/domain/use_cases/get_notifications_usecase.dart'
    as _i39;
import '../library/core/domain/use_cases/search_address_usecase.dart' as _i48;
import '../library/core/domain/use_cases/upload_multiple_files_usecase.dart'
    as _i52;
import '../library/core/domain/use_cases/upload_single_file_usecase.dart'
    as _i53;
import '../utils/route_utils/base_navigator.dart' as _i5;
import '../utils/totp.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AccountNavigator>(() => _i3.AccountNavigator());
    gh.factory<_i4.AccountToDomainMapper>(() => _i4.AccountToDomainMapper());
    gh.factory<_i5.BaseNavigator>(() => _i5.BaseNavigator());
    gh.factory<_i6.Cache>(() => _i7.LocalCache());
    gh.factory<_i8.CommunityAddressBloc>(() => _i8.CommunityAddressBloc());
    gh.factory<_i9.CommunityImageBloc>(() => _i9.CommunityImageBloc());
    gh.factory<_i10.CommunityLocalDataSource>(
        () => _i10.CommunityLocalDataSource(cache: gh<_i6.Cache>()));
    gh.factory<_i11.CommunityNavigator>(() => _i11.CommunityNavigator());
    gh.factory<_i12.CommunityToDomainMapper>(
        () => _i12.CommunityToDomainMapper());
    gh.factory<_i13.CreateCommunityBloc>(() => _i13.CreateCommunityBloc());
    gh.factory<_i14.InviteDetailsScreenBloc>(
        () => _i14.InviteDetailsScreenBloc());
    gh.factory<_i15.JoinCommunityScreenBloc>(
        () => _i15.JoinCommunityScreenBloc());
    gh.factory<_i16.MemberAddressScreenBloc>(
        () => _i16.MemberAddressScreenBloc());
    gh.factory<_i17.MessageScreenBloc>(() => _i17.MessageScreenBloc());
    gh.factory<_i18.NetworkInterceptor>(
        () => _i18.NetworkInterceptor(gh<_i6.Cache>()));
    gh.factory<_i19.NotificationNavigator>(() => _i19.NotificationNavigator());
    gh.factory<_i20.NotificationToDomainMapper>(
        () => _i20.NotificationToDomainMapper());
    gh.factory<_i21.PaymentScreenBloc>(() => _i21.PaymentScreenBloc());
    gh.factory<_i22.PlaceToDomainMapper>(() => _i22.PlaceToDomainMapper());
    gh.factory<_i23.StreetToDomainMapper>(() => _i23.StreetToDomainMapper());
    gh.factory<_i24.TOTP>(() => _i24.TOTP(gh<_i6.Cache>()));
    gh.factory<_i25.VisitorNavigator>(() => _i25.VisitorNavigator());
    gh.factory<_i26.VisitorScreenBloc>(() => _i26.VisitorScreenBloc());
    gh.factory<_i27.VisitorToDomainMapper>(
        () => _i27.VisitorToDomainMapper(gh<_i23.StreetToDomainMapper>()));
    gh.factory<_i28.AccountCommunityToDomainMapper>(
        () => _i28.AccountCommunityToDomainMapper(
              gh<_i12.CommunityToDomainMapper>(),
              gh<_i23.StreetToDomainMapper>(),
            ));
    gh.factory<_i29.AccountLocalDataSource>(
        () => _i29.AccountLocalDataSource(gh<_i6.Cache>()));
    gh.singleton<_i30.Api>(() => _i30.Api(gh<_i6.Cache>()));
    gh.factory<_i31.CommunityRemoteDataSource>(
        () => _i31.CommunityRemoteDataSource(api: gh<_i30.Api>()));
    gh.factory<_i32.CommunityRepository>(() => _i33.CommunityRepositoryImpl(
          gh<_i31.CommunityRemoteDataSource>(),
          gh<_i12.CommunityToDomainMapper>(),
          gh<_i23.StreetToDomainMapper>(),
          gh<_i28.AccountCommunityToDomainMapper>(),
          gh<_i10.CommunityLocalDataSource>(),
          gh<_i27.VisitorToDomainMapper>(),
        ));
    gh.factory<_i34.CoreRepository>(() => _i35.CoreRepositoryImpl(
          gh<_i30.Api>(),
          gh<_i22.PlaceToDomainMapper>(),
          gh<_i20.NotificationToDomainMapper>(),
        ));
    gh.factory<_i36.CreateCommunityUseCase>(
        () => _i36.CreateCommunityUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i37.GetAllCommunitiesUseCase>(
        () => _i37.GetAllCommunitiesUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i38.GetAllVisitorsUseCase>(
        () => _i38.GetAllVisitorsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i39.GetNotificationsUseCase>(
        () => _i39.GetNotificationsUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i40.GetPendingVisitorsUseCase>(
        () => _i40.GetPendingVisitorsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i41.GetPrimaryAccountCommunityUseCase>(() =>
        _i41.GetPrimaryAccountCommunityUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i42.GetRecentVisitorsUseCase>(
        () => _i42.GetRecentVisitorsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i43.GetStreetsUseCase>(
        () => _i43.GetStreetsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i44.GetTodayVisitorsUseCase>(
        () => _i44.GetTodayVisitorsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i45.GetUpcomingVisitorsUseCase>(
        () => _i45.GetUpcomingVisitorsUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i46.NotificationScreenBloc>(
        () => _i46.NotificationScreenBloc(gh<_i39.GetNotificationsUseCase>()));
    gh.factory<_i47.RequestJoinUseCase>(
        () => _i47.RequestJoinUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i48.SearchAddressUseCase>(
        () => _i48.SearchAddressUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i49.SearchCommunityUseCase>(
        () => _i49.SearchCommunityUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i50.SelectStreetScreenBloc>(
        () => _i50.SelectStreetScreenBloc(gh<_i43.GetStreetsUseCase>()));
    gh.factory<_i51.SendInviteUseCase>(
        () => _i51.SendInviteUseCase(gh<_i32.CommunityRepository>()));
    gh.factory<_i52.UploadMultipleFilesUseCase>(
        () => _i52.UploadMultipleFilesUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i53.UploadSingleFileUseCase>(
        () => _i53.UploadSingleFileUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i54.VisitorsListScreenBloc>(() => _i54.VisitorsListScreenBloc(
          gh<_i38.GetAllVisitorsUseCase>(),
          gh<_i45.GetUpcomingVisitorsUseCase>(),
          gh<_i44.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i55.AccountRemoteDataSource>(
        () => _i55.AccountRemoteDataSource(gh<_i30.Api>()));
    gh.factory<_i56.AccountRepository>(() => _i57.AccountRepositoryImpl(
          gh<_i4.AccountToDomainMapper>(),
          gh<_i29.AccountLocalDataSource>(),
          gh<_i32.CommunityRepository>(),
          remoteDataSource: gh<_i55.AccountRemoteDataSource>(),
        ));
    gh.factory<_i58.ChangePasswordUseCase>(
        () => _i58.ChangePasswordUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i59.ConfirmCreateBloc>(() => _i59.ConfirmCreateBloc(
          gh<_i52.UploadMultipleFilesUseCase>(),
          gh<_i36.CreateCommunityUseCase>(),
        ));
    gh.factory<_i60.ConfirmJoinScreenBloc>(
        () => _i60.ConfirmJoinScreenBloc(gh<_i47.RequestJoinUseCase>()));
    gh.factory<_i61.GetAccountUseCase>(
        () => _i61.GetAccountUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i62.HomeScreenBloc>(
        () => _i62.HomeScreenBloc(gh<_i61.GetAccountUseCase>()));
    gh.factory<_i63.InviteVisitorScreenBloc>(() => _i63.InviteVisitorScreenBloc(
          gh<_i41.GetPrimaryAccountCommunityUseCase>(),
          gh<_i51.SendInviteUseCase>(),
        ));
    gh.factory<_i64.IsLoginUseCase>(
        () => _i64.IsLoginUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i65.LoginUseCase>(
        () => _i65.LoginUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i66.LogoutUseCase>(
        () => _i66.LogoutUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i67.ProfileScreenBloc>(() => _i67.ProfileScreenBloc(
          gh<_i61.GetAccountUseCase>(),
          gh<_i37.GetAllCommunitiesUseCase>(),
          gh<_i66.LogoutUseCase>(),
        ));
    gh.factory<_i68.SearchAddressScreenBloc>(
        () => _i68.SearchAddressScreenBloc(gh<_i48.SearchAddressUseCase>()));
    gh.factory<_i69.SearchCommunityScreenBloc>(() =>
        _i69.SearchCommunityScreenBloc(gh<_i49.SearchCommunityUseCase>()));
    gh.factory<_i70.SendDevicePushTokenUseCase>(
        () => _i70.SendDevicePushTokenUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i71.SignUpUseCase>(
        () => _i71.SignUpUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i72.SignupScreenBloc>(() => _i72.SignupScreenBloc(
          gh<_i71.SignUpUseCase>(),
          gh<_i65.LoginUseCase>(),
        ));
    gh.factory<_i73.UpdateInfoUseCase>(
        () => _i73.UpdateInfoUseCase(gh<_i56.AccountRepository>()));
    gh.factory<_i74.ChangePasswordScreenBloc>(
        () => _i74.ChangePasswordScreenBloc(gh<_i58.ChangePasswordUseCase>()));
    gh.factory<_i75.DashboardScreenBloc>(() => _i75.DashboardScreenBloc(
          gh<_i61.GetAccountUseCase>(),
          gh<_i37.GetAllCommunitiesUseCase>(),
          gh<_i42.GetRecentVisitorsUseCase>(),
          gh<_i44.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i76.EditProfileScreenBloc>(() => _i76.EditProfileScreenBloc(
          gh<_i61.GetAccountUseCase>(),
          gh<_i53.UploadSingleFileUseCase>(),
          gh<_i73.UpdateInfoUseCase>(),
        ));
    gh.factory<_i77.LoginScreenBloc>(
        () => _i77.LoginScreenBloc(gh<_i65.LoginUseCase>()));
    return this;
  }
}
