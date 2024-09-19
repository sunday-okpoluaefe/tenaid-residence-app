// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api.dart' as _i27;
import '../core/network/network_interceptor.dart' as _i15;
import '../feature/account/account_navigator.dart' as _i3;
import '../feature/account/change_password/bloc/change_password_screen_bloc.dart'
    as _i66;
import '../feature/account/edit_profile/bloc/edit_profile_screen_bloc.dart'
    as _i68;
import '../feature/account/login/bloc/login_screen_bloc.dart' as _i69;
import '../feature/account/profile/bloc/profile_screen_bloc.dart' as _i58;
import '../feature/account/signup/bloc/signup_screen_bloc.dart' as _i63;
import '../feature/community/community_navigator.dart' as _i9;
import '../feature/community/confirm_join/bloc/confirm_join_screen_bloc.dart'
    as _i51;
import '../feature/community/join_community/bloc/join_community_screen_bloc.dart'
    as _i12;
import '../feature/community/member_address/bloc/member_address_screen_bloc.dart'
    as _i13;
import '../feature/community/search_community/bloc/search_community_screen_bloc.dart'
    as _i60;
import '../feature/community/select_street/bloc/select_street_screen_bloc.dart'
    as _i44;
import '../feature/core/search_address/bloc/search_address_screen_bloc.dart'
    as _i59;
import '../feature/home/bloc/home_screen_bloc.dart' as _i53;
import '../feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart'
    as _i67;
import '../feature/home/pages/messages/bloc/message_screen_bloc.dart' as _i14;
import '../feature/home/pages/payments/bloc/payment_screen_bloc.dart' as _i18;
import '../feature/home/pages/visitors/bloc/visitor_screen_bloc.dart' as _i23;
import '../feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart'
    as _i46;
import '../feature/notification/bloc/notification_screen_bloc.dart' as _i17;
import '../feature/notification/notification_navigator.dart' as _i16;
import '../feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart'
    as _i11;
import '../feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart'
    as _i54;
import '../feature/visitor/visitor_navigator.dart' as _i22;
import '../library/account/data/account_repository_impl.dart' as _i49;
import '../library/account/data/data_source/account_local_datasource.dart'
    as _i26;
import '../library/account/data/data_source/account_remote_datasource.dart'
    as _i47;
import '../library/account/data/mapper/account_to_domain_mapper.dart' as _i4;
import '../library/account/domain/account_repository.dart' as _i48;
import '../library/account/domain/use_cases/change_password_usecase.dart'
    as _i50;
import '../library/account/domain/use_cases/get_account_usecase.dart' as _i52;
import '../library/account/domain/use_cases/islogin_usecase.dart' as _i55;
import '../library/account/domain/use_cases/login_usecase.dart' as _i56;
import '../library/account/domain/use_cases/logout_usecase.dart' as _i57;
import '../library/account/domain/use_cases/send_device_push_token_usecase.dart'
    as _i61;
import '../library/account/domain/use_cases/signup_usecase.dart' as _i62;
import '../library/account/domain/use_cases/update_info_usecase.dart' as _i64;
import '../library/account/domain/use_cases/upload_file_usecase.dart' as _i65;
import '../library/community/data/community_repository_impl.dart' as _i30;
import '../library/community/data/data_source/community_local_datasource.dart'
    as _i8;
import '../library/community/data/data_source/community_remote_datasource.dart'
    as _i28;
import '../library/community/data/mapper/account_community_to_domain_mapper.dart'
    as _i25;
import '../library/community/data/mapper/community_to_domain_mapper.dart'
    as _i10;
import '../library/community/data/mapper/street_to_domain_mapper.dart' as _i20;
import '../library/community/data/mapper/visitor_to_domain_mapper.dart' as _i24;
import '../library/community/domain/community_repository.dart' as _i29;
import '../library/community/domain/entity/get_primary_account_community_usecase.dart'
    as _i36;
import '../library/community/domain/use_cases/get_all_communities_usecase.dart'
    as _i33;
import '../library/community/domain/use_cases/get_all_visitors_usecase.dart'
    as _i34;
import '../library/community/domain/use_cases/get_pending_visitors_usecase.dart'
    as _i35;
import '../library/community/domain/use_cases/get_recent_visitors_usecase.dart'
    as _i37;
import '../library/community/domain/use_cases/get_streets_usecase.dart' as _i38;
import '../library/community/domain/use_cases/get_today_visitors_usecase.dart'
    as _i39;
import '../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart'
    as _i40;
import '../library/community/domain/use_cases/request_join_usecase.dart'
    as _i41;
import '../library/community/domain/use_cases/search_community_usecase.dart'
    as _i43;
import '../library/community/domain/use_cases/send_invite_usecase.dart' as _i45;
import '../library/core/data/core_repository_impl.dart' as _i32;
import '../library/core/data/local_cache.dart' as _i7;
import '../library/core/data/mapper/place_to_domain_mapper.dart' as _i19;
import '../library/core/domain/cache.dart' as _i6;
import '../library/core/domain/core_repository.dart' as _i31;
import '../library/core/domain/use_cases/search_address_usecase.dart' as _i42;
import '../utils/route_utils/base_navigator.dart' as _i5;
import '../utils/totp.dart' as _i21;

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
    gh.factory<_i8.CommunityLocalDataSource>(
        () => _i8.CommunityLocalDataSource(cache: gh<_i6.Cache>()));
    gh.factory<_i9.CommunityNavigator>(() => _i9.CommunityNavigator());
    gh.factory<_i10.CommunityToDomainMapper>(
        () => _i10.CommunityToDomainMapper());
    gh.factory<_i11.InviteDetailsScreenBloc>(
        () => _i11.InviteDetailsScreenBloc());
    gh.factory<_i12.JoinCommunityScreenBloc>(
        () => _i12.JoinCommunityScreenBloc());
    gh.factory<_i13.MemberAddressScreenBloc>(
        () => _i13.MemberAddressScreenBloc());
    gh.factory<_i14.MessageScreenBloc>(() => _i14.MessageScreenBloc());
    gh.factory<_i15.NetworkInterceptor>(
        () => _i15.NetworkInterceptor(gh<_i6.Cache>()));
    gh.factory<_i16.NotificationNavigator>(() => _i16.NotificationNavigator());
    gh.factory<_i17.NotificationScreenBloc>(
        () => _i17.NotificationScreenBloc());
    gh.factory<_i18.PaymentScreenBloc>(() => _i18.PaymentScreenBloc());
    gh.factory<_i19.PlaceToDomainMapper>(() => _i19.PlaceToDomainMapper());
    gh.factory<_i20.StreetToDomainMapper>(() => _i20.StreetToDomainMapper());
    gh.factory<_i21.TOTP>(() => _i21.TOTP(gh<_i6.Cache>()));
    gh.factory<_i22.VisitorNavigator>(() => _i22.VisitorNavigator());
    gh.factory<_i23.VisitorScreenBloc>(() => _i23.VisitorScreenBloc());
    gh.factory<_i24.VisitorToDomainMapper>(
        () => _i24.VisitorToDomainMapper(gh<_i20.StreetToDomainMapper>()));
    gh.factory<_i25.AccountCommunityToDomainMapper>(
        () => _i25.AccountCommunityToDomainMapper(
              gh<_i10.CommunityToDomainMapper>(),
              gh<_i20.StreetToDomainMapper>(),
            ));
    gh.factory<_i26.AccountLocalDataSource>(
        () => _i26.AccountLocalDataSource(gh<_i6.Cache>()));
    gh.singleton<_i27.Api>(() => _i27.Api(gh<_i6.Cache>()));
    gh.factory<_i28.CommunityRemoteDataSource>(
        () => _i28.CommunityRemoteDataSource(api: gh<_i27.Api>()));
    gh.factory<_i29.CommunityRepository>(() => _i30.CommunityRepositoryImpl(
          gh<_i28.CommunityRemoteDataSource>(),
          gh<_i10.CommunityToDomainMapper>(),
          gh<_i20.StreetToDomainMapper>(),
          gh<_i25.AccountCommunityToDomainMapper>(),
          gh<_i8.CommunityLocalDataSource>(),
          gh<_i24.VisitorToDomainMapper>(),
        ));
    gh.factory<_i31.CoreRepository>(() => _i32.CoreRepositoryImpl(
          gh<_i27.Api>(),
          gh<_i19.PlaceToDomainMapper>(),
        ));
    gh.factory<_i33.GetAllCommunitiesUseCase>(
        () => _i33.GetAllCommunitiesUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i34.GetAllVisitorsUseCase>(
        () => _i34.GetAllVisitorsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i35.GetPendingVisitorsUseCase>(
        () => _i35.GetPendingVisitorsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i36.GetPrimaryAccountCommunityUseCase>(() =>
        _i36.GetPrimaryAccountCommunityUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i37.GetRecentVisitorsUseCase>(
        () => _i37.GetRecentVisitorsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i38.GetStreetsUseCase>(
        () => _i38.GetStreetsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i39.GetTodayVisitorsUseCase>(
        () => _i39.GetTodayVisitorsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i40.GetUpcomingVisitorsUseCase>(
        () => _i40.GetUpcomingVisitorsUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i41.RequestJoinUseCase>(
        () => _i41.RequestJoinUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i42.SearchAddressUseCase>(
        () => _i42.SearchAddressUseCase(gh<_i31.CoreRepository>()));
    gh.factory<_i43.SearchCommunityUseCase>(
        () => _i43.SearchCommunityUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i44.SelectStreetScreenBloc>(
        () => _i44.SelectStreetScreenBloc(gh<_i38.GetStreetsUseCase>()));
    gh.factory<_i45.SendInviteUseCase>(
        () => _i45.SendInviteUseCase(gh<_i29.CommunityRepository>()));
    gh.factory<_i46.VisitorsListScreenBloc>(() => _i46.VisitorsListScreenBloc(
          gh<_i34.GetAllVisitorsUseCase>(),
          gh<_i40.GetUpcomingVisitorsUseCase>(),
          gh<_i39.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i47.AccountRemoteDataSource>(
        () => _i47.AccountRemoteDataSource(gh<_i27.Api>()));
    gh.factory<_i48.AccountRepository>(() => _i49.AccountRepositoryImpl(
          gh<_i4.AccountToDomainMapper>(),
          gh<_i26.AccountLocalDataSource>(),
          gh<_i29.CommunityRepository>(),
          remoteDataSource: gh<_i47.AccountRemoteDataSource>(),
        ));
    gh.factory<_i50.ChangePasswordUseCase>(
        () => _i50.ChangePasswordUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i51.ConfirmJoinScreenBloc>(
        () => _i51.ConfirmJoinScreenBloc(gh<_i41.RequestJoinUseCase>()));
    gh.factory<_i52.GetAccountUseCase>(
        () => _i52.GetAccountUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i53.HomeScreenBloc>(
        () => _i53.HomeScreenBloc(gh<_i52.GetAccountUseCase>()));
    gh.factory<_i54.InviteVisitorScreenBloc>(() => _i54.InviteVisitorScreenBloc(
          gh<_i36.GetPrimaryAccountCommunityUseCase>(),
          gh<_i45.SendInviteUseCase>(),
        ));
    gh.factory<_i55.IsLoginUseCase>(
        () => _i55.IsLoginUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i56.LoginUseCase>(
        () => _i56.LoginUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i57.LogoutUseCase>(
        () => _i57.LogoutUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i58.ProfileScreenBloc>(() => _i58.ProfileScreenBloc(
          gh<_i52.GetAccountUseCase>(),
          gh<_i33.GetAllCommunitiesUseCase>(),
          gh<_i57.LogoutUseCase>(),
        ));
    gh.factory<_i59.SearchAddressScreenBloc>(
        () => _i59.SearchAddressScreenBloc(gh<_i42.SearchAddressUseCase>()));
    gh.factory<_i60.SearchCommunityScreenBloc>(() =>
        _i60.SearchCommunityScreenBloc(gh<_i43.SearchCommunityUseCase>()));
    gh.factory<_i61.SendDevicePushTokenUseCase>(
        () => _i61.SendDevicePushTokenUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i62.SignUpUseCase>(
        () => _i62.SignUpUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i63.SignupScreenBloc>(() => _i63.SignupScreenBloc(
          gh<_i62.SignUpUseCase>(),
          gh<_i56.LoginUseCase>(),
        ));
    gh.factory<_i64.UpdateInfoUseCase>(
        () => _i64.UpdateInfoUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i65.UploadFileUseCase>(
        () => _i65.UploadFileUseCase(gh<_i48.AccountRepository>()));
    gh.factory<_i66.ChangePasswordScreenBloc>(
        () => _i66.ChangePasswordScreenBloc(gh<_i50.ChangePasswordUseCase>()));
    gh.factory<_i67.DashboardScreenBloc>(() => _i67.DashboardScreenBloc(
          gh<_i52.GetAccountUseCase>(),
          gh<_i33.GetAllCommunitiesUseCase>(),
          gh<_i37.GetRecentVisitorsUseCase>(),
          gh<_i39.GetTodayVisitorsUseCase>(),
        ));
    gh.factory<_i68.EditProfileScreenBloc>(() => _i68.EditProfileScreenBloc(
          gh<_i52.GetAccountUseCase>(),
          gh<_i65.UploadFileUseCase>(),
          gh<_i64.UpdateInfoUseCase>(),
        ));
    gh.factory<_i69.LoginScreenBloc>(
        () => _i69.LoginScreenBloc(gh<_i56.LoginUseCase>()));
    return this;
  }
}
