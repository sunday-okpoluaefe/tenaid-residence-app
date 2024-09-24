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
import '../feature/account/account_navigator.dart' as _i4;
import '../feature/account/change_password/bloc/change_password_screen_bloc.dart'
    as _i91;
import '../feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart'
    as _i94;
import '../feature/account/login/bloc/login_screen_bloc.dart' as _i95;
import '../feature/account/profile/bloc/profile_screen_bloc.dart' as _i85;
import '../feature/account/signup/bloc/signup_screen_bloc.dart' as _i89;
import '../feature/community/add_access_point/bloc/add_access_point_bloc.dart'
    as _i70;
import '../feature/community/community_access_point/bloc/community_access_point_bloc.dart'
    as _i72;
import '../feature/community/community_address/bloc/community_address_bloc.dart'
    as _i9;
import '../feature/community/community_detail/bloc/community_detail_bloc.dart'
    as _i73;
import '../feature/community/community_image/bloc/community_image_bloc.dart'
    as _i10;
import '../feature/community/community_navigator.dart' as _i92;
import '../feature/community/community_street/bloc/community_street_bloc.dart'
    as _i74;
import '../feature/community/confirm_create/bloc/confirm_create_bloc.dart'
    as _i75;
import '../feature/community/confirm_join/bloc/confirm_join_screen_bloc.dart'
    as _i77;
import '../feature/community/create_community/bloc/create_community_bloc.dart'
    as _i13;
import '../feature/community/join_community/bloc/join_community_screen_bloc.dart'
    as _i15;
import '../feature/community/join_request_detail/bloc/join_request_detail_bloc.dart'
    as _i82;
import '../feature/community/join_request_detail/confirm_decline_join_request/bloc/confirm_decline_join_request_bloc.dart'
    as _i76;
import '../feature/community/list_community/bloc/list_community_bloc.dart'
    as _i58;
import '../feature/community/member_address/bloc/member_address_screen_bloc.dart'
    as _i16;
import '../feature/community/pending_join_request/bloc/pending_join_request_bloc.dart'
    as _i59;
import '../feature/community/search_community/bloc/search_community_screen_bloc.dart'
    as _i86;
import '../feature/community/select_street/bloc/select_street_screen_bloc.dart'
    as _i63;
import '../feature/core/search_address/bloc/search_address_screen_bloc.dart'
    as _i61;
import '../feature/home/bloc/home_screen_bloc.dart' as _i79;
import '../feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart'
    as _i93;
import '../feature/home/pages/messages/bloc/message_screen_bloc.dart' as _i17;
import '../feature/home/pages/payments/bloc/payment_screen_bloc.dart' as _i21;
import '../feature/home/pages/visitors/bloc/visitor_screen_bloc.dart' as _i26;
import '../feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart'
    as _i67;
import '../feature/notification/bloc/notification_screen_bloc.dart' as _i36;
import '../feature/notification/notification_navigator.dart' as _i19;
import '../feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart'
    as _i14;
import '../feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart'
    as _i80;
import '../feature/visitor/visitor_navigator.dart' as _i25;
import '../library/account/data/account_repository_impl.dart' as _i69;
import '../library/account/data/data_source/account_local_datasource.dart'
    as _i29;
import '../library/account/data/data_source/account_remote_datasource.dart'
    as _i40;
import '../library/account/data/mapper/account_to_domain_mapper.dart' as _i5;
import '../library/account/domain/account_repository.dart' as _i68;
import '../library/account/domain/use_cases/change_password_usecase.dart'
    as _i71;
import '../library/account/domain/use_cases/get_account_usecase.dart' as _i78;
import '../library/account/domain/use_cases/islogin_usecase.dart' as _i81;
import '../library/account/domain/use_cases/login_usecase.dart' as _i83;
import '../library/account/domain/use_cases/logout_usecase.dart' as _i84;
import '../library/account/domain/use_cases/send_device_push_token_usecase.dart'
    as _i87;
import '../library/account/domain/use_cases/signup_usecase.dart' as _i88;
import '../library/account/domain/use_cases/update_info_usecase.dart' as _i90;
import '../library/community/data/community_repository_impl.dart' as _i42;
import '../library/community/data/data_source/community_local_datasource.dart'
    as _i11;
import '../library/community/data/data_source/community_remote_datasource.dart'
    as _i31;
import '../library/community/data/mapper/access_point_to_domain_mapper.dart'
    as _i3;
import '../library/community/data/mapper/account_community_to_domain_mapper.dart'
    as _i28;
import '../library/community/data/mapper/community_to_domain_mapper.dart'
    as _i12;
import '../library/community/data/mapper/get_access_points_usecase.dart'
    as _i45;
import '../library/community/data/mapper/join_request_to_domain_mapper.dart'
    as _i35;
import '../library/community/data/mapper/street_to_domain_mapper.dart' as _i23;
import '../library/community/data/mapper/visitor_to_domain_mapper.dart' as _i27;
import '../library/community/domain/community_repository.dart' as _i41;
import '../library/community/domain/use_cases/create_access_point_usecase.dart'
    as _i43;
import '../library/community/domain/use_cases/create_community_usecase.dart'
    as _i44;
import '../library/community/domain/use_cases/get_all_communities_usecase.dart'
    as _i46;
import '../library/community/domain/use_cases/get_all_visitors_usecase.dart'
    as _i47;
import '../library/community/domain/use_cases/get_community_access_points_usecase.dart'
    as _i48;
import '../library/community/domain/use_cases/get_join_request_count_usecase.dart'
    as _i49;
import '../library/community/domain/use_cases/get_join_request_usecase.dart'
    as _i50;
import '../library/community/domain/use_cases/get_join_requests_usecase.dart'
    as _i51;
import '../library/community/domain/use_cases/get_pending_visitors_usecase.dart'
    as _i52;
import '../library/community/domain/use_cases/get_primary_account_community_usecase.dart'
    as _i53;
import '../library/community/domain/use_cases/get_recent_visitors_usecase.dart'
    as _i54;
import '../library/community/domain/use_cases/get_streets_usecase.dart' as _i55;
import '../library/community/domain/use_cases/get_today_visitors_usecase.dart'
    as _i56;
import '../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart'
    as _i57;
import '../library/community/domain/use_cases/request_join_usecase.dart'
    as _i60;
import '../library/community/domain/use_cases/search_community_usecase.dart'
    as _i62;
import '../library/community/domain/use_cases/send_invite_usecase.dart' as _i64;
import '../library/community/domain/use_cases/set_join_request_status_usecase.dart'
    as _i65;
import '../library/community/domain/use_cases/set_primary_community_usecase.dart'
    as _i66;
import '../library/core/data/core_repository_impl.dart' as _i33;
import '../library/core/data/local_cache.dart' as _i8;
import '../library/core/data/mapper/notification_to_domain_mapper.dart' as _i20;
import '../library/core/data/mapper/place_to_domain_mapper.dart' as _i22;
import '../library/core/domain/cache.dart' as _i7;
import '../library/core/domain/core_repository.dart' as _i32;
import '../library/core/domain/use_cases/get_notifications_usecase.dart'
    as _i34;
import '../library/core/domain/use_cases/search_address_usecase.dart' as _i37;
import '../library/core/domain/use_cases/upload_multiple_files_usecase.dart'
    as _i38;
import '../library/core/domain/use_cases/upload_single_file_usecase.dart'
    as _i39;
import '../utils/route_utils/base_navigator.dart' as _i6;
import '../utils/route_utils/navigation_handler.dart' as _i96;
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
    gh.factory<_i3.AccessPointToDomainMapper>(
        () => _i3.AccessPointToDomainMapper());
    gh.factory<_i4.AccountNavigator>(() => _i4.AccountNavigator());
    gh.factory<_i5.AccountToDomainMapper>(() => _i5.AccountToDomainMapper());
    gh.factory<_i6.BaseNavigator>(() => _i6.BaseNavigator());
    gh.factory<_i7.Cache>(() => _i8.LocalCache());
    gh.factory<_i9.CommunityAddressBloc>(() => _i9.CommunityAddressBloc());
    gh.factory<_i10.CommunityImageBloc>(() => _i10.CommunityImageBloc());
    gh.factory<_i11.CommunityLocalDataSource>(
        () => _i11.CommunityLocalDataSource(cache: gh<_i7.Cache>()));
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
        () => _i18.NetworkInterceptor(gh<_i7.Cache>()));
    gh.factory<_i19.NotificationNavigator>(() => _i19.NotificationNavigator());
    gh.factory<_i20.NotificationToDomainMapper>(
        () => _i20.NotificationToDomainMapper());
    gh.factory<_i21.PaymentScreenBloc>(() => _i21.PaymentScreenBloc());
    gh.factory<_i22.PlaceToDomainMapper>(() => _i22.PlaceToDomainMapper());
    gh.factory<_i23.StreetToDomainMapper>(() => _i23.StreetToDomainMapper());
    gh.factory<_i24.TOTP>(() => _i24.TOTP(gh<_i7.Cache>()));
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
        () => _i29.AccountLocalDataSource(gh<_i7.Cache>()));
    gh.singleton<_i30.Api>(() => _i30.Api(gh<_i7.Cache>()));
    gh.factory<_i31.CommunityRemoteDataSource>(
        () => _i31.CommunityRemoteDataSource(api: gh<_i30.Api>()));
    gh.factory<_i32.CoreRepository>(() => _i33.CoreRepositoryImpl(
          gh<_i30.Api>(),
          gh<_i22.PlaceToDomainMapper>(),
          gh<_i20.NotificationToDomainMapper>(),
        ));
    gh.factory<_i34.GetNotificationsUseCase>(
        () => _i34.GetNotificationsUseCase(gh<_i32.CoreRepository>()));
    gh.factory<_i35.JoinRequestToDomainMapper>(
        () => _i35.JoinRequestToDomainMapper(
              communityMapper: gh<_i12.CommunityToDomainMapper>(),
              accountMapper: gh<_i5.AccountToDomainMapper>(),
              streetMapper: gh<_i23.StreetToDomainMapper>(),
            ));
    gh.factory<_i36.NotificationScreenBloc>(
        () => _i36.NotificationScreenBloc(gh<_i34.GetNotificationsUseCase>()));
    gh.factory<_i37.SearchAddressUseCase>(
        () => _i37.SearchAddressUseCase(gh<_i32.CoreRepository>()));
    gh.factory<_i38.UploadMultipleFilesUseCase>(
        () => _i38.UploadMultipleFilesUseCase(gh<_i32.CoreRepository>()));
    gh.factory<_i39.UploadSingleFileUseCase>(
        () => _i39.UploadSingleFileUseCase(gh<_i32.CoreRepository>()));
    gh.factory<_i40.AccountRemoteDataSource>(
        () => _i40.AccountRemoteDataSource(gh<_i30.Api>()));
    gh.factory<_i41.CommunityRepository>(() => _i42.CommunityRepositoryImpl(
          gh<_i31.CommunityRemoteDataSource>(),
          gh<_i12.CommunityToDomainMapper>(),
          gh<_i23.StreetToDomainMapper>(),
          gh<_i28.AccountCommunityToDomainMapper>(),
          gh<_i11.CommunityLocalDataSource>(),
          gh<_i27.VisitorToDomainMapper>(),
          gh<_i35.JoinRequestToDomainMapper>(),
          gh<_i3.AccessPointToDomainMapper>(),
        ));
    gh.factory<_i43.CreateAccessPointUseCase>(
        () => _i43.CreateAccessPointUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i44.CreateCommunityUseCase>(
        () => _i44.CreateCommunityUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i45.GetAccessPointsUseCase>(
        () => _i45.GetAccessPointsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i46.GetAllCommunitiesUseCase>(
        () => _i46.GetAllCommunitiesUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i47.GetAllVisitorsUseCase>(
        () => _i47.GetAllVisitorsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i48.GetCommunityAccessPointsUseCase>(() =>
        _i48.GetCommunityAccessPointsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i49.GetJoinRequestCountUseCase>(
        () => _i49.GetJoinRequestCountUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i50.GetJoinRequestUseCase>(
        () => _i50.GetJoinRequestUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i51.GetJoinRequestsUseCase>(
        () => _i51.GetJoinRequestsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i52.GetPendingVisitorsUseCase>(
        () => _i52.GetPendingVisitorsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i53.GetPrimaryAccountCommunityUseCase>(() =>
        _i53.GetPrimaryAccountCommunityUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i54.GetRecentVisitorsUseCase>(
        () => _i54.GetRecentVisitorsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i55.GetStreetsUseCase>(
        () => _i55.GetStreetsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i56.GetTodayVisitorsUseCase>(
        () => _i56.GetTodayVisitorsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i57.GetUpcomingVisitorsUseCase>(
        () => _i57.GetUpcomingVisitorsUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i58.ListCommunityBloc>(
        () => _i58.ListCommunityBloc(gh<_i46.GetAllCommunitiesUseCase>()));
    gh.factory<_i59.PendingJoinRequestBloc>(() => _i59.PendingJoinRequestBloc(
          gh<_i51.GetJoinRequestsUseCase>(),
          gh<_i53.GetPrimaryAccountCommunityUseCase>(),
        ));
    gh.factory<_i60.RequestJoinUseCase>(
        () => _i60.RequestJoinUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i61.SearchAddressScreenBloc>(
        () => _i61.SearchAddressScreenBloc(gh<_i37.SearchAddressUseCase>()));
    gh.factory<_i62.SearchCommunityUseCase>(
        () => _i62.SearchCommunityUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i63.SelectStreetScreenBloc>(
        () => _i63.SelectStreetScreenBloc(gh<_i55.GetStreetsUseCase>()));
    gh.factory<_i64.SendInviteUseCase>(
        () => _i64.SendInviteUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i65.SetJoinRequestStatusUseCase>(
        () => _i65.SetJoinRequestStatusUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i66.SetPrimaryCommunityUseCase>(
        () => _i66.SetPrimaryCommunityUseCase(gh<_i41.CommunityRepository>()));
    gh.factory<_i67.VisitorsListScreenBloc>(() => _i67.VisitorsListScreenBloc(
          gh<_i47.GetAllVisitorsUseCase>(),
          gh<_i57.GetUpcomingVisitorsUseCase>(),
          gh<_i56.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i68.AccountRepository>(() => _i69.AccountRepositoryImpl(
          gh<_i5.AccountToDomainMapper>(),
          gh<_i29.AccountLocalDataSource>(),
          gh<_i41.CommunityRepository>(),
          remoteDataSource: gh<_i40.AccountRemoteDataSource>(),
        ));
    gh.factory<_i70.AddAccessPointBloc>(
        () => _i70.AddAccessPointBloc(gh<_i43.CreateAccessPointUseCase>()));
    gh.factory<_i71.ChangePasswordUseCase>(
        () => _i71.ChangePasswordUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i72.CommunityAccessPointBloc>(() =>
        _i72.CommunityAccessPointBloc(
            gh<_i48.GetCommunityAccessPointsUseCase>()));
    gh.factory<_i73.CommunityDetailBloc>(
        () => _i73.CommunityDetailBloc(gh<_i66.SetPrimaryCommunityUseCase>()));
    gh.factory<_i74.CommunityStreetBloc>(
        () => _i74.CommunityStreetBloc(gh<_i55.GetStreetsUseCase>()));
    gh.factory<_i75.ConfirmCreateBloc>(() => _i75.ConfirmCreateBloc(
          gh<_i38.UploadMultipleFilesUseCase>(),
          gh<_i44.CreateCommunityUseCase>(),
        ));
    gh.factory<_i76.ConfirmDeclineJoinRequestBloc>(() =>
        _i76.ConfirmDeclineJoinRequestBloc(
            gh<_i65.SetJoinRequestStatusUseCase>()));
    gh.factory<_i77.ConfirmJoinScreenBloc>(
        () => _i77.ConfirmJoinScreenBloc(gh<_i60.RequestJoinUseCase>()));
    gh.factory<_i78.GetAccountUseCase>(
        () => _i78.GetAccountUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i79.HomeScreenBloc>(
        () => _i79.HomeScreenBloc(gh<_i78.GetAccountUseCase>()));
    gh.factory<_i80.InviteVisitorScreenBloc>(() => _i80.InviteVisitorScreenBloc(
          gh<_i53.GetPrimaryAccountCommunityUseCase>(),
          gh<_i64.SendInviteUseCase>(),
        ));
    gh.factory<_i81.IsLoginUseCase>(
        () => _i81.IsLoginUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i82.JoinRequestDetailBloc>(() => _i82.JoinRequestDetailBloc(
          gh<_i50.GetJoinRequestUseCase>(),
          gh<_i65.SetJoinRequestStatusUseCase>(),
        ));
    gh.factory<_i83.LoginUseCase>(
        () => _i83.LoginUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i84.LogoutUseCase>(
        () => _i84.LogoutUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i85.ProfileScreenBloc>(() => _i85.ProfileScreenBloc(
          gh<_i78.GetAccountUseCase>(),
          gh<_i46.GetAllCommunitiesUseCase>(),
          gh<_i84.LogoutUseCase>(),
        ));
    gh.factory<_i86.SearchCommunityScreenBloc>(() =>
        _i86.SearchCommunityScreenBloc(gh<_i62.SearchCommunityUseCase>()));
    gh.factory<_i87.SendDevicePushTokenUseCase>(
        () => _i87.SendDevicePushTokenUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i88.SignUpUseCase>(
        () => _i88.SignUpUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i89.SignupScreenBloc>(() => _i89.SignupScreenBloc(
          gh<_i88.SignUpUseCase>(),
          gh<_i83.LoginUseCase>(),
        ));
    gh.factory<_i90.UpdateInfoUseCase>(
        () => _i90.UpdateInfoUseCase(gh<_i68.AccountRepository>()));
    gh.factory<_i91.ChangePasswordScreenBloc>(
        () => _i91.ChangePasswordScreenBloc(gh<_i71.ChangePasswordUseCase>()));
    gh.factory<_i92.CommunityNavigator>(() => _i92.CommunityNavigator(
          gh<_i78.GetAccountUseCase>(),
          gh<_i4.AccountNavigator>(),
        ));
    gh.factory<_i93.DashboardScreenBloc>(() => _i93.DashboardScreenBloc(
          gh<_i78.GetAccountUseCase>(),
          gh<_i46.GetAllCommunitiesUseCase>(),
          gh<_i54.GetRecentVisitorsUseCase>(),
          gh<_i56.GetTodayVisitorsUseCase>(),
          gh<_i49.GetJoinRequestCountUseCase>(),
        ));
    gh.factory<_i94.EditProfileScreenBloc>(() => _i94.EditProfileScreenBloc(
          gh<_i78.GetAccountUseCase>(),
          gh<_i39.UploadSingleFileUseCase>(),
          gh<_i90.UpdateInfoUseCase>(),
        ));
    gh.factory<_i95.LoginScreenBloc>(
        () => _i95.LoginScreenBloc(gh<_i83.LoginUseCase>()));
    gh.factory<_i96.NavigationHandler>(() => _i96.NavigationHandler(
        communityNavigator: gh<_i92.CommunityNavigator>()));
    return this;
  }
}
