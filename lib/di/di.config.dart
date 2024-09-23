// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api.dart' as _i32;
import '../core/network/network_interceptor.dart' as _i20;
import '../feature/account/account_navigator.dart' as _i3;
import '../feature/account/change_password/bloc/change_password_screen_bloc.dart'
    as _i85;
import '../feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart'
    as _i87;
import '../feature/account/login/bloc/login_screen_bloc.dart' as _i88;
import '../feature/account/profile/bloc/profile_screen_bloc.dart' as _i79;
import '../feature/account/signup/bloc/signup_screen_bloc.dart' as _i83;
import '../feature/community/community_address/bloc/community_address_bloc.dart'
    as _i8;
import '../feature/community/community_detail/bloc/community_detail_bloc.dart'
    as _i9;
import '../feature/community/community_image/bloc/community_image_bloc.dart'
    as _i10;
import '../feature/community/community_navigator.dart' as _i12;
import '../feature/community/confirm_create/bloc/confirm_create_bloc.dart'
    as _i69;
import '../feature/community/confirm_join/bloc/confirm_join_screen_bloc.dart'
    as _i71;
import '../feature/community/create_community/bloc/create_community_bloc.dart'
    as _i14;
import '../feature/community/join_community/bloc/join_community_screen_bloc.dart'
    as _i16;
import '../feature/community/join_request_detail/bloc/join_request_detail_bloc.dart'
    as _i76;
import '../feature/community/join_request_detail/confirm_decline_join_request/bloc/confirm_decline_join_request_bloc.dart'
    as _i70;
import '../feature/community/list_community/bloc/list_community_bloc.dart'
    as _i57;
import '../feature/community/member_address/bloc/member_address_screen_bloc.dart'
    as _i17;
import '../feature/community/pending_join_request/bloc/pending_join_request_bloc.dart'
    as _i58;
import '../feature/community/search_community/bloc/search_community_screen_bloc.dart'
    as _i80;
import '../feature/community/select_street/bloc/select_street_screen_bloc.dart'
    as _i62;
import '../feature/core/search_address/bloc/search_address_screen_bloc.dart'
    as _i60;
import '../feature/home/bloc/home_screen_bloc.dart' as _i73;
import '../feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart'
    as _i86;
import '../feature/home/pages/messages/bloc/message_screen_bloc.dart' as _i18;
import '../feature/home/pages/payments/bloc/payment_screen_bloc.dart' as _i23;
import '../feature/home/pages/visitors/bloc/visitor_screen_bloc.dart' as _i28;
import '../feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart'
    as _i65;
import '../feature/notification/bloc/notification_screen_bloc.dart' as _i38;
import '../feature/notification/notification_navigator.dart' as _i21;
import '../feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart'
    as _i15;
import '../feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart'
    as _i74;
import '../feature/visitor/visitor_navigator.dart' as _i27;
import '../library/account/data/account_repository_impl.dart' as _i67;
import '../library/account/data/data_source/account_local_datasource.dart'
    as _i31;
import '../library/account/data/data_source/account_remote_datasource.dart'
    as _i42;
import '../library/account/data/mapper/account_to_domain_mapper.dart' as _i4;
import '../library/account/domain/account_repository.dart' as _i66;
import '../library/account/domain/use_cases/change_password_usecase.dart'
    as _i68;
import '../library/account/domain/use_cases/get_account_usecase.dart' as _i72;
import '../library/account/domain/use_cases/islogin_usecase.dart' as _i75;
import '../library/account/domain/use_cases/login_usecase.dart' as _i77;
import '../library/account/domain/use_cases/logout_usecase.dart' as _i78;
import '../library/account/domain/use_cases/send_device_push_token_usecase.dart'
    as _i81;
import '../library/account/domain/use_cases/signup_usecase.dart' as _i82;
import '../library/account/domain/use_cases/update_info_usecase.dart' as _i84;
import '../library/community/data/community_repository_impl.dart' as _i44;
import '../library/community/data/data_source/community_local_datasource.dart'
    as _i11;
import '../library/community/data/data_source/community_remote_datasource.dart'
    as _i33;
import '../library/community/data/mapper/account_community_to_domain_mapper.dart'
    as _i30;
import '../library/community/data/mapper/community_to_domain_mapper.dart'
    as _i13;
import '../library/community/data/mapper/join_request_to_domain_mapper.dart'
    as _i37;
import '../library/community/data/mapper/street_to_domain_mapper.dart' as _i25;
import '../library/community/data/mapper/visitor_to_domain_mapper.dart' as _i29;
import '../library/community/domain/community_repository.dart' as _i43;
import '../library/community/domain/use_cases/create_community_usecase.dart'
    as _i45;
import '../library/community/domain/use_cases/get_all_communities_usecase.dart'
    as _i46;
import '../library/community/domain/use_cases/get_all_visitors_usecase.dart'
    as _i47;
import '../library/community/domain/use_cases/get_join_request_count_usecase.dart'
    as _i48;
import '../library/community/domain/use_cases/get_join_request_usecase.dart'
    as _i49;
import '../library/community/domain/use_cases/get_join_requests_usecase.dart'
    as _i50;
import '../library/community/domain/use_cases/get_pending_visitors_usecase.dart'
    as _i51;
import '../library/community/domain/use_cases/get_primary_account_community_usecase.dart'
    as _i52;
import '../library/community/domain/use_cases/get_recent_visitors_usecase.dart'
    as _i53;
import '../library/community/domain/use_cases/get_streets_usecase.dart' as _i54;
import '../library/community/domain/use_cases/get_today_visitors_usecase.dart'
    as _i55;
import '../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart'
    as _i56;
import '../library/community/domain/use_cases/request_join_usecase.dart'
    as _i59;
import '../library/community/domain/use_cases/search_community_usecase.dart'
    as _i61;
import '../library/community/domain/use_cases/send_invite_usecase.dart' as _i63;
import '../library/community/domain/use_cases/set_join_request_status_usecase.dart'
    as _i64;
import '../library/core/data/core_repository_impl.dart' as _i35;
import '../library/core/data/local_cache.dart' as _i7;
import '../library/core/data/mapper/notification_to_domain_mapper.dart' as _i22;
import '../library/core/data/mapper/place_to_domain_mapper.dart' as _i24;
import '../library/core/domain/cache.dart' as _i6;
import '../library/core/domain/core_repository.dart' as _i34;
import '../library/core/domain/use_cases/get_notifications_usecase.dart'
    as _i36;
import '../library/core/domain/use_cases/search_address_usecase.dart' as _i39;
import '../library/core/domain/use_cases/upload_multiple_files_usecase.dart'
    as _i40;
import '../library/core/domain/use_cases/upload_single_file_usecase.dart'
    as _i41;
import '../utils/route_utils/base_navigator.dart' as _i5;
import '../utils/route_utils/navigation_handler.dart' as _i19;
import '../utils/totp.dart' as _i26;

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
    gh.factory<_i9.CommunityDetailBloc>(() => _i9.CommunityDetailBloc());
    gh.factory<_i10.CommunityImageBloc>(() => _i10.CommunityImageBloc());
    gh.factory<_i11.CommunityLocalDataSource>(
        () => _i11.CommunityLocalDataSource(cache: gh<_i6.Cache>()));
    gh.factory<_i12.CommunityNavigator>(() => _i12.CommunityNavigator());
    gh.factory<_i13.CommunityToDomainMapper>(
        () => _i13.CommunityToDomainMapper());
    gh.factory<_i14.CreateCommunityBloc>(() => _i14.CreateCommunityBloc());
    gh.factory<_i15.InviteDetailsScreenBloc>(
        () => _i15.InviteDetailsScreenBloc());
    gh.factory<_i16.JoinCommunityScreenBloc>(
        () => _i16.JoinCommunityScreenBloc());
    gh.factory<_i17.MemberAddressScreenBloc>(
        () => _i17.MemberAddressScreenBloc());
    gh.factory<_i18.MessageScreenBloc>(() => _i18.MessageScreenBloc());
    gh.factory<_i19.NavigationHandler>(() => _i19.NavigationHandler(
        communityNavigator: gh<_i12.CommunityNavigator>()));
    gh.factory<_i20.NetworkInterceptor>(
        () => _i20.NetworkInterceptor(gh<_i6.Cache>()));
    gh.factory<_i21.NotificationNavigator>(() => _i21.NotificationNavigator());
    gh.factory<_i22.NotificationToDomainMapper>(
        () => _i22.NotificationToDomainMapper());
    gh.factory<_i23.PaymentScreenBloc>(() => _i23.PaymentScreenBloc());
    gh.factory<_i24.PlaceToDomainMapper>(() => _i24.PlaceToDomainMapper());
    gh.factory<_i25.StreetToDomainMapper>(() => _i25.StreetToDomainMapper());
    gh.factory<_i26.TOTP>(() => _i26.TOTP(gh<_i6.Cache>()));
    gh.factory<_i27.VisitorNavigator>(() => _i27.VisitorNavigator());
    gh.factory<_i28.VisitorScreenBloc>(() => _i28.VisitorScreenBloc());
    gh.factory<_i29.VisitorToDomainMapper>(
        () => _i29.VisitorToDomainMapper(gh<_i25.StreetToDomainMapper>()));
    gh.factory<_i30.AccountCommunityToDomainMapper>(
        () => _i30.AccountCommunityToDomainMapper(
              gh<_i13.CommunityToDomainMapper>(),
              gh<_i25.StreetToDomainMapper>(),
            ));
    gh.factory<_i31.AccountLocalDataSource>(
        () => _i31.AccountLocalDataSource(gh<_i6.Cache>()));
    gh.singleton<_i32.Api>(() => _i32.Api(gh<_i6.Cache>()));
    gh.factory<_i33.CommunityRemoteDataSource>(
        () => _i33.CommunityRemoteDataSource(api: gh<_i32.Api>()));
    gh.factory<_i34.CoreRepository>(() => _i35.CoreRepositoryImpl(
          gh<_i32.Api>(),
          gh<_i24.PlaceToDomainMapper>(),
          gh<_i22.NotificationToDomainMapper>(),
        ));
    gh.factory<_i36.GetNotificationsUseCase>(
        () => _i36.GetNotificationsUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i37.JoinRequestToDomainMapper>(
        () => _i37.JoinRequestToDomainMapper(
              communityMapper: gh<_i13.CommunityToDomainMapper>(),
              accountMapper: gh<_i4.AccountToDomainMapper>(),
              streetMapper: gh<_i25.StreetToDomainMapper>(),
            ));
    gh.factory<_i38.NotificationScreenBloc>(
        () => _i38.NotificationScreenBloc(gh<_i36.GetNotificationsUseCase>()));
    gh.factory<_i39.SearchAddressUseCase>(
        () => _i39.SearchAddressUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i40.UploadMultipleFilesUseCase>(
        () => _i40.UploadMultipleFilesUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i41.UploadSingleFileUseCase>(
        () => _i41.UploadSingleFileUseCase(gh<_i34.CoreRepository>()));
    gh.factory<_i42.AccountRemoteDataSource>(
        () => _i42.AccountRemoteDataSource(gh<_i32.Api>()));
    gh.factory<_i43.CommunityRepository>(() => _i44.CommunityRepositoryImpl(
          gh<_i33.CommunityRemoteDataSource>(),
          gh<_i13.CommunityToDomainMapper>(),
          gh<_i25.StreetToDomainMapper>(),
          gh<_i30.AccountCommunityToDomainMapper>(),
          gh<_i11.CommunityLocalDataSource>(),
          gh<_i29.VisitorToDomainMapper>(),
          gh<_i37.JoinRequestToDomainMapper>(),
        ));
    gh.factory<_i45.CreateCommunityUseCase>(
        () => _i45.CreateCommunityUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i46.GetAllCommunitiesUseCase>(
        () => _i46.GetAllCommunitiesUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i47.GetAllVisitorsUseCase>(
        () => _i47.GetAllVisitorsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i48.GetJoinRequestCountUseCase>(
        () => _i48.GetJoinRequestCountUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i49.GetJoinRequestUseCase>(
        () => _i49.GetJoinRequestUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i50.GetJoinRequestsUseCase>(
        () => _i50.GetJoinRequestsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i51.GetPendingVisitorsUseCase>(
        () => _i51.GetPendingVisitorsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i52.GetPrimaryAccountCommunityUseCase>(() =>
        _i52.GetPrimaryAccountCommunityUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i53.GetRecentVisitorsUseCase>(
        () => _i53.GetRecentVisitorsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i54.GetStreetsUseCase>(
        () => _i54.GetStreetsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i55.GetTodayVisitorsUseCase>(
        () => _i55.GetTodayVisitorsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i56.GetUpcomingVisitorsUseCase>(
        () => _i56.GetUpcomingVisitorsUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i57.ListCommunityBloc>(
        () => _i57.ListCommunityBloc(gh<_i46.GetAllCommunitiesUseCase>()));
    gh.factory<_i58.PendingJoinRequestBloc>(() => _i58.PendingJoinRequestBloc(
          gh<_i50.GetJoinRequestsUseCase>(),
          gh<_i52.GetPrimaryAccountCommunityUseCase>(),
        ));
    gh.factory<_i59.RequestJoinUseCase>(
        () => _i59.RequestJoinUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i60.SearchAddressScreenBloc>(
        () => _i60.SearchAddressScreenBloc(gh<_i39.SearchAddressUseCase>()));
    gh.factory<_i61.SearchCommunityUseCase>(
        () => _i61.SearchCommunityUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i62.SelectStreetScreenBloc>(
        () => _i62.SelectStreetScreenBloc(gh<_i54.GetStreetsUseCase>()));
    gh.factory<_i63.SendInviteUseCase>(
        () => _i63.SendInviteUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i64.SetJoinRequestStatusUseCase>(
        () => _i64.SetJoinRequestStatusUseCase(gh<_i43.CommunityRepository>()));
    gh.factory<_i65.VisitorsListScreenBloc>(() => _i65.VisitorsListScreenBloc(
          gh<_i47.GetAllVisitorsUseCase>(),
          gh<_i56.GetUpcomingVisitorsUseCase>(),
          gh<_i55.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i66.AccountRepository>(() => _i67.AccountRepositoryImpl(
          gh<_i4.AccountToDomainMapper>(),
          gh<_i31.AccountLocalDataSource>(),
          gh<_i43.CommunityRepository>(),
          remoteDataSource: gh<_i42.AccountRemoteDataSource>(),
        ));
    gh.factory<_i68.ChangePasswordUseCase>(
        () => _i68.ChangePasswordUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i69.ConfirmCreateBloc>(() => _i69.ConfirmCreateBloc(
          gh<_i40.UploadMultipleFilesUseCase>(),
          gh<_i45.CreateCommunityUseCase>(),
        ));
    gh.factory<_i70.ConfirmDeclineJoinRequestBloc>(() =>
        _i70.ConfirmDeclineJoinRequestBloc(
            gh<_i64.SetJoinRequestStatusUseCase>()));
    gh.factory<_i71.ConfirmJoinScreenBloc>(
        () => _i71.ConfirmJoinScreenBloc(gh<_i59.RequestJoinUseCase>()));
    gh.factory<_i72.GetAccountUseCase>(
        () => _i72.GetAccountUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i73.HomeScreenBloc>(
        () => _i73.HomeScreenBloc(gh<_i72.GetAccountUseCase>()));
    gh.factory<_i74.InviteVisitorScreenBloc>(() => _i74.InviteVisitorScreenBloc(
          gh<_i52.GetPrimaryAccountCommunityUseCase>(),
          gh<_i63.SendInviteUseCase>(),
        ));
    gh.factory<_i75.IsLoginUseCase>(
        () => _i75.IsLoginUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i76.JoinRequestDetailBloc>(() => _i76.JoinRequestDetailBloc(
          gh<_i49.GetJoinRequestUseCase>(),
          gh<_i64.SetJoinRequestStatusUseCase>(),
        ));
    gh.factory<_i77.LoginUseCase>(
        () => _i77.LoginUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i78.LogoutUseCase>(
        () => _i78.LogoutUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i79.ProfileScreenBloc>(() => _i79.ProfileScreenBloc(
          gh<_i72.GetAccountUseCase>(),
          gh<_i46.GetAllCommunitiesUseCase>(),
          gh<_i78.LogoutUseCase>(),
        ));
    gh.factory<_i80.SearchCommunityScreenBloc>(() =>
        _i80.SearchCommunityScreenBloc(gh<_i61.SearchCommunityUseCase>()));
    gh.factory<_i81.SendDevicePushTokenUseCase>(
        () => _i81.SendDevicePushTokenUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i82.SignUpUseCase>(
        () => _i82.SignUpUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i83.SignupScreenBloc>(() => _i83.SignupScreenBloc(
          gh<_i82.SignUpUseCase>(),
          gh<_i77.LoginUseCase>(),
        ));
    gh.factory<_i84.UpdateInfoUseCase>(
        () => _i84.UpdateInfoUseCase(gh<_i66.AccountRepository>()));
    gh.factory<_i85.ChangePasswordScreenBloc>(
        () => _i85.ChangePasswordScreenBloc(gh<_i68.ChangePasswordUseCase>()));
    gh.factory<_i86.DashboardScreenBloc>(() => _i86.DashboardScreenBloc(
          gh<_i72.GetAccountUseCase>(),
          gh<_i46.GetAllCommunitiesUseCase>(),
          gh<_i53.GetRecentVisitorsUseCase>(),
          gh<_i55.GetTodayVisitorsUseCase>(),
          gh<_i48.GetJoinRequestCountUseCase>(),
        ));
    gh.factory<_i87.EditProfileScreenBloc>(() => _i87.EditProfileScreenBloc(
          gh<_i72.GetAccountUseCase>(),
          gh<_i41.UploadSingleFileUseCase>(),
          gh<_i84.UpdateInfoUseCase>(),
        ));
    gh.factory<_i88.LoginScreenBloc>(
        () => _i88.LoginScreenBloc(gh<_i77.LoginUseCase>()));
    return this;
  }
}
