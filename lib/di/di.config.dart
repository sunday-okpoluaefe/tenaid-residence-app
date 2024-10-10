// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api.dart' as _i34;
import '../core/network/network_interceptor.dart' as _i22;
import '../feature/account/account_navigator.dart' as _i4;
import '../feature/account/change_password/bloc/change_password_screen_bloc.dart'
    as _i110;
import '../feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart'
    as _i113;
import '../feature/account/login/bloc/login_screen_bloc.dart' as _i114;
import '../feature/account/profile/bloc/profile_screen_bloc.dart' as _i104;
import '../feature/account/signup/bloc/signup_screen_bloc.dart' as _i108;
import '../feature/community/add_access_point/bloc/add_access_point_bloc.dart'
    as _i82;
import '../feature/community/community_access_point/bloc/community_access_point_bloc.dart'
    as _i84;
import '../feature/community/community_address/bloc/community_address_bloc.dart'
    as _i9;
import '../feature/community/community_detail/bloc/community_detail_bloc.dart'
    as _i85;
import '../feature/community/community_image/bloc/community_image_bloc.dart'
    as _i10;
import '../feature/community/community_navigator.dart' as _i111;
import '../feature/community/community_street/bloc/community_street_bloc.dart'
    as _i86;
import '../feature/community/confirm_create/bloc/confirm_create_bloc.dart'
    as _i87;
import '../feature/community/confirm_join/bloc/confirm_join_screen_bloc.dart'
    as _i89;
import '../feature/community/create_community/bloc/create_community_bloc.dart'
    as _i14;
import '../feature/community/create_community_street/bloc/create_community_street_bloc.dart'
    as _i90;
import '../feature/community/join_community/bloc/join_community_screen_bloc.dart'
    as _i18;
import '../feature/community/join_request_detail/bloc/join_request_detail_bloc.dart'
    as _i100;
import '../feature/community/join_request_detail/confirm_decline_join_request/bloc/confirm_decline_join_request_bloc.dart'
    as _i88;
import '../feature/community/list_community/bloc/list_community_bloc.dart'
    as _i65;
import '../feature/community/member_address/bloc/member_address_screen_bloc.dart'
    as _i20;
import '../feature/community/pending_join_request/bloc/pending_join_request_bloc.dart'
    as _i68;
import '../feature/community/search_community/bloc/search_community_screen_bloc.dart'
    as _i105;
import '../feature/community/select_street/bloc/select_street_screen_bloc.dart'
    as _i73;
import '../feature/core/search_address/bloc/search_address_screen_bloc.dart'
    as _i71;
import '../feature/home/bloc/home_screen_bloc.dart' as _i97;
import '../feature/home/home_navigator.dart' as _i15;
import '../feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart'
    as _i112;
import '../feature/home/pages/messages/bloc/message_screen_bloc.dart' as _i103;
import '../feature/home/pages/payments/bloc/payment_screen_bloc.dart' as _i25;
import '../feature/home/pages/visitors/bloc/visitor_screen_bloc.dart' as _i30;
import '../feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart'
    as _i79;
import '../feature/notification/bloc/notification_screen_bloc.dart' as _i40;
import '../feature/notification/notification_navigator.dart' as _i23;
import '../feature/visitor/exit_visitor/bloc/exit_visitor_bloc.dart' as _i91;
import '../feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart'
    as _i17;
import '../feature/visitor/invite_status/bloc/invite_status_bloc.dart' as _i98;
import '../feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart'
    as _i99;
import '../feature/visitor/visitor_detail/bloc/visitor_detail_bloc.dart'
    as _i78;
import '../feature/visitor/visitor_navigator.dart' as _i29;
import '../library/account/data/account_repository_impl.dart' as _i81;
import '../library/account/data/data_source/account_local_datasource.dart'
    as _i33;
import '../library/account/data/data_source/account_remote_datasource.dart'
    as _i45;
import '../library/account/data/mapper/account_to_domain_mapper.dart' as _i5;
import '../library/account/domain/account_repository.dart' as _i80;
import '../library/account/domain/use_cases/change_password_usecase.dart'
    as _i83;
import '../library/account/domain/use_cases/get_account_usecase.dart' as _i92;
import '../library/account/domain/use_cases/get_authorization_usecase.dart'
    as _i93;
import '../library/account/domain/use_cases/login_usecase.dart' as _i101;
import '../library/account/domain/use_cases/logout_usecase.dart' as _i102;
import '../library/account/domain/use_cases/send_device_push_token_usecase.dart'
    as _i106;
import '../library/account/domain/use_cases/signup_usecase.dart' as _i107;
import '../library/account/domain/use_cases/update_info_usecase.dart' as _i109;
import '../library/community/data/community_repository_impl.dart' as _i47;
import '../library/community/data/data_source/community_local_datasource.dart'
    as _i11;
import '../library/community/data/data_source/community_remote_datasource.dart'
    as _i35;
import '../library/community/data/mapper/access_point_to_domain_mapper.dart'
    as _i3;
import '../library/community/data/mapper/account_community_to_domain_mapper.dart'
    as _i32;
import '../library/community/data/mapper/community_to_domain_mapper.dart'
    as _i13;
import '../library/community/data/mapper/get_access_points_usecase.dart'
    as _i51;
import '../library/community/data/mapper/invite_activity_to_domain_mapper.dart'
    as _i16;
import '../library/community/data/mapper/join_request_to_domain_mapper.dart'
    as _i39;
import '../library/community/data/mapper/street_to_domain_mapper.dart' as _i27;
import '../library/community/data/mapper/visitor_to_domain_mapper.dart' as _i31;
import '../library/community/domain/community_repository.dart' as _i46;
import '../library/community/domain/use_cases/create_access_point_usecase.dart'
    as _i48;
import '../library/community/domain/use_cases/create_community_street_usecase.dart'
    as _i49;
import '../library/community/domain/use_cases/create_community_usecase.dart'
    as _i50;
import '../library/community/domain/use_cases/get_all_communities_usecase.dart'
    as _i52;
import '../library/community/domain/use_cases/get_all_visitors_usecase.dart'
    as _i53;
import '../library/community/domain/use_cases/get_community_access_points_usecase.dart'
    as _i54;
import '../library/community/domain/use_cases/get_invite_activities_usecase.dart'
    as _i55;
import '../library/community/domain/use_cases/get_join_request_count_usecase.dart'
    as _i56;
import '../library/community/domain/use_cases/get_join_request_usecase.dart'
    as _i57;
import '../library/community/domain/use_cases/get_join_requests_usecase.dart'
    as _i58;
import '../library/community/domain/use_cases/get_pending_visitors_usecase.dart'
    as _i59;
import '../library/community/domain/use_cases/get_primary_account_community_usecase.dart'
    as _i60;
import '../library/community/domain/use_cases/get_recent_visitors_usecase.dart'
    as _i61;
import '../library/community/domain/use_cases/get_streets_usecase.dart' as _i62;
import '../library/community/domain/use_cases/get_today_visitors_usecase.dart'
    as _i63;
import '../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart'
    as _i64;
import '../library/community/domain/use_cases/request_join_usecase.dart'
    as _i69;
import '../library/community/domain/use_cases/search_community_usecase.dart'
    as _i72;
import '../library/community/domain/use_cases/send_invite_usecase.dart' as _i74;
import '../library/community/domain/use_cases/set_join_request_status_usecase.dart'
    as _i75;
import '../library/community/domain/use_cases/set_primary_community_usecase.dart'
    as _i76;
import '../library/community/domain/use_cases/update_exit_code_usecase.dart'
    as _i77;
import '../library/core/data/core_repository_impl.dart' as _i37;
import '../library/core/data/local_cache.dart' as _i8;
import '../library/core/data/mapper/notification_to_domain_mapper.dart' as _i24;
import '../library/core/data/mapper/place_to_domain_mapper.dart' as _i26;
import '../library/core/domain/cache.dart' as _i7;
import '../library/core/domain/core_repository.dart' as _i36;
import '../library/core/domain/use_cases/get_notifications_usecase.dart'
    as _i38;
import '../library/core/domain/use_cases/search_address_usecase.dart' as _i42;
import '../library/core/domain/use_cases/upload_multiple_files_usecase.dart'
    as _i43;
import '../library/core/domain/use_cases/upload_single_file_usecase.dart'
    as _i44;
import '../library/message/data/datasource/local_message_datasource.dart'
    as _i19;
import '../library/message/data/datasource/remote_message_datasource.dart'
    as _i41;
import '../library/message/data/mapper/community_message_mapper.dart' as _i12;
import '../library/message/data/message_repository_impl.dart' as _i67;
import '../library/message/domain/message_respository.dart' as _i66;
import '../library/message/domain/usecase/get_last_message_read_date_usecase.dart'
    as _i94;
import '../library/message/domain/usecase/get_messages_usecase.dart' as _i95;
import '../library/message/domain/usecase/get_unread_messages_usecase.dart'
    as _i96;
import '../library/message/domain/usecase/save_last_message_read_date_usecase.dart'
    as _i70;
import '../utils/message_service.dart' as _i21;
import '../utils/route_utils/base_navigator.dart' as _i6;
import '../utils/route_utils/navigation_handler.dart' as _i115;
import '../utils/totp.dart' as _i28;

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
    gh.factory<_i12.CommunityMessageMapper>(
        () => _i12.CommunityMessageMapper());
    gh.factory<_i13.CommunityToDomainMapper>(
        () => _i13.CommunityToDomainMapper());
    gh.factory<_i14.CreateCommunityBloc>(() => _i14.CreateCommunityBloc());
    gh.factory<_i15.HomeNavigator>(() => _i15.HomeNavigator());
    gh.factory<_i16.InviteActivityToDomainMapper>(() =>
        _i16.InviteActivityToDomainMapper(gh<_i3.AccessPointToDomainMapper>()));
    gh.factory<_i17.InviteDetailsScreenBloc>(
        () => _i17.InviteDetailsScreenBloc());
    gh.factory<_i16.InviteToDomainMapper>(() => _i16.InviteToDomainMapper());
    gh.factory<_i18.JoinCommunityScreenBloc>(
        () => _i18.JoinCommunityScreenBloc());
    gh.factory<_i19.LocalMessageDataSource>(
        () => _i19.LocalMessageDataSource());
    gh.factory<_i20.MemberAddressScreenBloc>(
        () => _i20.MemberAddressScreenBloc());
    gh.factory<_i21.MessageService>(() => _i21.MessageService());
    gh.factory<_i22.NetworkInterceptor>(
        () => _i22.NetworkInterceptor(gh<_i7.Cache>()));
    gh.factory<_i23.NotificationNavigator>(() => _i23.NotificationNavigator());
    gh.factory<_i24.NotificationToDomainMapper>(
        () => _i24.NotificationToDomainMapper());
    gh.factory<_i25.PaymentScreenBloc>(() => _i25.PaymentScreenBloc());
    gh.factory<_i26.PlaceToDomainMapper>(() => _i26.PlaceToDomainMapper());
    gh.factory<_i27.StreetToDomainMapper>(() => _i27.StreetToDomainMapper());
    gh.factory<_i28.TOTP>(() => _i28.TOTP(gh<_i7.Cache>()));
    gh.factory<_i29.VisitorNavigator>(() => _i29.VisitorNavigator());
    gh.factory<_i30.VisitorScreenBloc>(() => _i30.VisitorScreenBloc());
    gh.factory<_i31.VisitorToDomainMapper>(
        () => _i31.VisitorToDomainMapper(gh<_i27.StreetToDomainMapper>()));
    gh.factory<_i32.AccountCommunityToDomainMapper>(
        () => _i32.AccountCommunityToDomainMapper(
              gh<_i13.CommunityToDomainMapper>(),
              gh<_i27.StreetToDomainMapper>(),
            ));
    gh.factory<_i33.AccountLocalDataSource>(
        () => _i33.AccountLocalDataSource(gh<_i7.Cache>()));
    gh.singleton<_i34.Api>(() => _i34.Api(gh<_i7.Cache>()));
    gh.factory<_i35.CommunityRemoteDataSource>(
        () => _i35.CommunityRemoteDataSource(api: gh<_i34.Api>()));
    gh.factory<_i36.CoreRepository>(() => _i37.CoreRepositoryImpl(
          gh<_i34.Api>(),
          gh<_i26.PlaceToDomainMapper>(),
          gh<_i24.NotificationToDomainMapper>(),
        ));
    gh.factory<_i38.GetNotificationsUseCase>(
        () => _i38.GetNotificationsUseCase(gh<_i36.CoreRepository>()));
    gh.factory<_i39.JoinRequestToDomainMapper>(
        () => _i39.JoinRequestToDomainMapper(
              communityMapper: gh<_i13.CommunityToDomainMapper>(),
              accountMapper: gh<_i5.AccountToDomainMapper>(),
              streetMapper: gh<_i27.StreetToDomainMapper>(),
            ));
    gh.factory<_i40.NotificationScreenBloc>(
        () => _i40.NotificationScreenBloc(gh<_i38.GetNotificationsUseCase>()));
    gh.factory<_i41.RemoteMessageDataSource>(
        () => _i41.RemoteMessageDataSource(gh<_i34.Api>()));
    gh.factory<_i42.SearchAddressUseCase>(
        () => _i42.SearchAddressUseCase(gh<_i36.CoreRepository>()));
    gh.factory<_i43.UploadMultipleFilesUseCase>(
        () => _i43.UploadMultipleFilesUseCase(gh<_i36.CoreRepository>()));
    gh.factory<_i44.UploadSingleFileUseCase>(
        () => _i44.UploadSingleFileUseCase(gh<_i36.CoreRepository>()));
    gh.factory<_i45.AccountRemoteDataSource>(
        () => _i45.AccountRemoteDataSource(gh<_i34.Api>()));
    gh.factory<_i46.CommunityRepository>(() => _i47.CommunityRepositoryImpl(
          gh<_i35.CommunityRemoteDataSource>(),
          gh<_i13.CommunityToDomainMapper>(),
          gh<_i27.StreetToDomainMapper>(),
          gh<_i32.AccountCommunityToDomainMapper>(),
          gh<_i11.CommunityLocalDataSource>(),
          gh<_i31.VisitorToDomainMapper>(),
          gh<_i39.JoinRequestToDomainMapper>(),
          gh<_i3.AccessPointToDomainMapper>(),
          gh<_i16.InviteActivityToDomainMapper>(),
          gh<_i16.InviteToDomainMapper>(),
        ));
    gh.factory<_i48.CreateAccessPointUseCase>(
        () => _i48.CreateAccessPointUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i49.CreateCommunityStreetUseCase>(() =>
        _i49.CreateCommunityStreetUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i50.CreateCommunityUseCase>(
        () => _i50.CreateCommunityUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i51.GetAccessPointsUseCase>(
        () => _i51.GetAccessPointsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i52.GetAllCommunitiesUseCase>(
        () => _i52.GetAllCommunitiesUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i53.GetAllVisitorsUseCase>(
        () => _i53.GetAllVisitorsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i54.GetCommunityAccessPointsUseCase>(() =>
        _i54.GetCommunityAccessPointsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i55.GetInviteActivitiesUseCase>(
        () => _i55.GetInviteActivitiesUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i56.GetJoinRequestCountUseCase>(
        () => _i56.GetJoinRequestCountUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i57.GetJoinRequestUseCase>(
        () => _i57.GetJoinRequestUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i58.GetJoinRequestsUseCase>(
        () => _i58.GetJoinRequestsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i59.GetPendingVisitorsUseCase>(
        () => _i59.GetPendingVisitorsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i60.GetPrimaryAccountCommunityUseCase>(() =>
        _i60.GetPrimaryAccountCommunityUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i61.GetRecentVisitorsUseCase>(
        () => _i61.GetRecentVisitorsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i62.GetStreetsUseCase>(
        () => _i62.GetStreetsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i63.GetTodayVisitorsUseCase>(
        () => _i63.GetTodayVisitorsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i64.GetUpcomingVisitorsUseCase>(
        () => _i64.GetUpcomingVisitorsUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i65.ListCommunityBloc>(
        () => _i65.ListCommunityBloc(gh<_i52.GetAllCommunitiesUseCase>()));
    gh.factory<_i66.MessageRepository>(() => _i67.MessageRepositoryImpl(
          gh<_i12.CommunityMessageMapper>(),
          gh<_i7.Cache>(),
          gh<_i19.LocalMessageDataSource>(),
          gh<_i41.RemoteMessageDataSource>(),
        ));
    gh.factory<_i68.PendingJoinRequestBloc>(() => _i68.PendingJoinRequestBloc(
          gh<_i58.GetJoinRequestsUseCase>(),
          gh<_i60.GetPrimaryAccountCommunityUseCase>(),
        ));
    gh.factory<_i69.RequestJoinUseCase>(
        () => _i69.RequestJoinUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i70.SaveLastMessageReadDateUseCase>(() =>
        _i70.SaveLastMessageReadDateUseCase(gh<_i66.MessageRepository>()));
    gh.factory<_i71.SearchAddressScreenBloc>(
        () => _i71.SearchAddressScreenBloc(gh<_i42.SearchAddressUseCase>()));
    gh.factory<_i72.SearchCommunityUseCase>(
        () => _i72.SearchCommunityUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i73.SelectStreetScreenBloc>(
        () => _i73.SelectStreetScreenBloc(gh<_i62.GetStreetsUseCase>()));
    gh.factory<_i74.SendInviteUseCase>(
        () => _i74.SendInviteUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i75.SetJoinRequestStatusUseCase>(
        () => _i75.SetJoinRequestStatusUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i76.SetPrimaryCommunityUseCase>(
        () => _i76.SetPrimaryCommunityUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i77.UpdateExitCodeUseCase>(
        () => _i77.UpdateExitCodeUseCase(gh<_i46.CommunityRepository>()));
    gh.factory<_i78.VisitorDetailBloc>(
        () => _i78.VisitorDetailBloc(gh<_i55.GetInviteActivitiesUseCase>()));
    gh.factory<_i79.VisitorsListScreenBloc>(() => _i79.VisitorsListScreenBloc(
          gh<_i53.GetAllVisitorsUseCase>(),
          gh<_i64.GetUpcomingVisitorsUseCase>(),
          gh<_i63.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i80.AccountRepository>(() => _i81.AccountRepositoryImpl(
          gh<_i5.AccountToDomainMapper>(),
          gh<_i33.AccountLocalDataSource>(),
          gh<_i46.CommunityRepository>(),
          remoteDataSource: gh<_i45.AccountRemoteDataSource>(),
        ));
    gh.factory<_i82.AddAccessPointBloc>(
        () => _i82.AddAccessPointBloc(gh<_i48.CreateAccessPointUseCase>()));
    gh.factory<_i83.ChangePasswordUseCase>(
        () => _i83.ChangePasswordUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i84.CommunityAccessPointBloc>(() =>
        _i84.CommunityAccessPointBloc(
            gh<_i54.GetCommunityAccessPointsUseCase>()));
    gh.factory<_i85.CommunityDetailBloc>(
        () => _i85.CommunityDetailBloc(gh<_i76.SetPrimaryCommunityUseCase>()));
    gh.factory<_i86.CommunityStreetBloc>(
        () => _i86.CommunityStreetBloc(gh<_i62.GetStreetsUseCase>()));
    gh.factory<_i87.ConfirmCreateBloc>(() => _i87.ConfirmCreateBloc(
          gh<_i43.UploadMultipleFilesUseCase>(),
          gh<_i50.CreateCommunityUseCase>(),
        ));
    gh.factory<_i88.ConfirmDeclineJoinRequestBloc>(() =>
        _i88.ConfirmDeclineJoinRequestBloc(
            gh<_i75.SetJoinRequestStatusUseCase>()));
    gh.factory<_i89.ConfirmJoinScreenBloc>(
        () => _i89.ConfirmJoinScreenBloc(gh<_i69.RequestJoinUseCase>()));
    gh.factory<_i90.CreateCommunityStreetBloc>(() =>
        _i90.CreateCommunityStreetBloc(
            gh<_i49.CreateCommunityStreetUseCase>()));
    gh.factory<_i91.ExitVisitorBloc>(() => _i91.ExitVisitorBloc(
          gh<_i74.SendInviteUseCase>(),
          gh<_i60.GetPrimaryAccountCommunityUseCase>(),
          gh<_i28.TOTP>(),
        ));
    gh.factory<_i92.GetAccountUseCase>(
        () => _i92.GetAccountUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i93.GetAuthorizationUseCase>(
        () => _i93.GetAuthorizationUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i94.GetLastMessageReadDateUseCase>(
        () => _i94.GetLastMessageReadDateUseCase(gh<_i66.MessageRepository>()));
    gh.factory<_i95.GetMessagesUseCase>(
        () => _i95.GetMessagesUseCase(gh<_i66.MessageRepository>()));
    gh.factory<_i96.GetUnreadMessagesUseCase>(
        () => _i96.GetUnreadMessagesUseCase(gh<_i66.MessageRepository>()));
    gh.factory<_i97.HomeScreenBloc>(
        () => _i97.HomeScreenBloc(gh<_i92.GetAccountUseCase>()));
    gh.factory<_i98.InviteStatusBloc>(() => _i98.InviteStatusBloc(
          gh<_i77.UpdateExitCodeUseCase>(),
          gh<_i28.TOTP>(),
          gh<_i60.GetPrimaryAccountCommunityUseCase>(),
        ));
    gh.factory<_i99.InviteVisitorScreenBloc>(() => _i99.InviteVisitorScreenBloc(
          gh<_i60.GetPrimaryAccountCommunityUseCase>(),
          gh<_i74.SendInviteUseCase>(),
        ));
    gh.factory<_i100.JoinRequestDetailBloc>(() => _i100.JoinRequestDetailBloc(
          gh<_i57.GetJoinRequestUseCase>(),
          gh<_i75.SetJoinRequestStatusUseCase>(),
        ));
    gh.factory<_i101.LoginUseCase>(
        () => _i101.LoginUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i102.LogoutUseCase>(
        () => _i102.LogoutUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i103.MessageScreenBloc>(() => _i103.MessageScreenBloc(
          gh<_i21.MessageService>(),
          gh<_i93.GetAuthorizationUseCase>(),
          gh<_i60.GetPrimaryAccountCommunityUseCase>(),
          gh<_i95.GetMessagesUseCase>(),
          gh<_i92.GetAccountUseCase>(),
          gh<_i94.GetLastMessageReadDateUseCase>(),
          gh<_i96.GetUnreadMessagesUseCase>(),
        ));
    gh.factory<_i104.ProfileScreenBloc>(() => _i104.ProfileScreenBloc(
          gh<_i92.GetAccountUseCase>(),
          gh<_i52.GetAllCommunitiesUseCase>(),
          gh<_i102.LogoutUseCase>(),
        ));
    gh.factory<_i105.SearchCommunityScreenBloc>(() =>
        _i105.SearchCommunityScreenBloc(gh<_i72.SearchCommunityUseCase>()));
    gh.factory<_i106.SendDevicePushTokenUseCase>(
        () => _i106.SendDevicePushTokenUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i107.SignUpUseCase>(
        () => _i107.SignUpUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i108.SignupScreenBloc>(() => _i108.SignupScreenBloc(
          gh<_i107.SignUpUseCase>(),
          gh<_i101.LoginUseCase>(),
        ));
    gh.factory<_i109.UpdateInfoUseCase>(
        () => _i109.UpdateInfoUseCase(gh<_i80.AccountRepository>()));
    gh.factory<_i110.ChangePasswordScreenBloc>(
        () => _i110.ChangePasswordScreenBloc(gh<_i83.ChangePasswordUseCase>()));
    gh.factory<_i111.CommunityNavigator>(() => _i111.CommunityNavigator(
          gh<_i92.GetAccountUseCase>(),
          gh<_i4.AccountNavigator>(),
        ));
    gh.factory<_i112.DashboardScreenBloc>(() => _i112.DashboardScreenBloc(
          gh<_i92.GetAccountUseCase>(),
          gh<_i52.GetAllCommunitiesUseCase>(),
          gh<_i61.GetRecentVisitorsUseCase>(),
          gh<_i63.GetTodayVisitorsUseCase>(),
          gh<_i56.GetJoinRequestCountUseCase>(),
        ));
    gh.factory<_i113.EditProfileScreenBloc>(() => _i113.EditProfileScreenBloc(
          gh<_i92.GetAccountUseCase>(),
          gh<_i44.UploadSingleFileUseCase>(),
          gh<_i109.UpdateInfoUseCase>(),
        ));
    gh.factory<_i114.LoginScreenBloc>(
        () => _i114.LoginScreenBloc(gh<_i101.LoginUseCase>()));
    gh.factory<_i115.NavigationHandler>(() => _i115.NavigationHandler(
          gh<_i111.CommunityNavigator>(),
          gh<_i29.VisitorNavigator>(),
          gh<_i15.HomeNavigator>(),
        ));
    return this;
  }
}
