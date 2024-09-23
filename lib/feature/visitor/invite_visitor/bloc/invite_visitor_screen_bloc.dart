import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_param.dart';
import 'package:tenaid_mobile/utils/resettable.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';

import '../../../../library/community/domain/use_cases/get_primary_account_community_usecase.dart';
import '../../../../library/community/domain/use_cases/send_invite_usecase.dart';
import '../../../../utils/app_bloc.dart';
import '../../../../utils/totp.dart';

part 'invite_visitor_screen_bloc.g.dart';
part 'invite_visitor_screen_event.dart';
part 'invite_visitor_screen_state.dart';

@injectable
class InviteVisitorScreenBloc
    extends AppBloc<InviteVisitorScreenEvent, InviteVisitorScreenState> {
  final TOTP totp = GetIt.instance.get();
  InviteType type = InviteType.single;
  final GetPrimaryAccountCommunityUseCase getPrimaryAccountCommunity;
  final SendInviteUseCase sendInvite;

  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  String? _name;

  bool get isTimeFuture {
    if (_startDate == null)
      return false;
    else if (_startTime == null) return true;

    DateTime dt = _startDate!.withTime(_startTime!);
    return dt.isAfter(DateTime.now());
  }

  bool get isDateFuture {
    if (_endDate == null || _startDate == null) return false;
    return (_endDate!.difference(_startDate!).inDays > 0);
  }

  bool get validated {
    switch (type) {
      case InviteType.single:
        return (_name?.isNotEmpty == true) &&
            _startTime != null &&
            _startDate != null &&
            isTimeFuture;

      case InviteType.extended:
        return (_name?.isNotEmpty == true) &&
            _endDate != null &&
            _startDate != null &&
            isDateFuture;
    }
  }

  InviteVisitorScreenBloc(this.getPrimaryAccountCommunity, this.sendInvite)
      : super(InviteVisitorScreenState()) {
    on<OnStartDateChanged>((event, emit) {
      _startDate = event.dateTime;
      emit(state.copyWith(
          startDate: event.dateTime,
          validated: validated,
          startTimeError: !isTimeFuture));
    });

    on<OnEndDateChanged>((event, emit) {
      _endDate = event.dateTime;

      emit(state.copyWith(
          endDate: event.dateTime,
          validated: validated,
          endDateError: !isDateFuture));
    });

    on<OnTimeChanged>((event, emit) {
      _startTime = event.timeOfDay;

      emit(state.copyWith(
          startTime: event.timeOfDay,
          validated: validated,
          startTimeError: !isTimeFuture));
    });

    on<OnNameChanged>((event, emit) {
      _name = event.name;
      emit(state.copyWith(name: event.name, validated: validated));
    });

    on<OnPurposeChanged>((event, emit) {
      emit(state.copyWith(purpose: event.purpose));
    });

    on<OnValidityChanged>((event, emit) {
      emit(state.copyWith(validity: event.validity));
    });

    on<OnInviteTypeChanged>((event, emit) {
      type = event.type;
      emit(state.copyWith(type: event.type, validated: validated));
    });

    on<OnContinueClicked>((event, emit) async {
      emit(state.copyWith(loading: true));
      InviteParam param = InviteParam(
          date: DateTime.now().toUtc().toIso8601String(),
          name: _name!,
          photo: "",
          reason: state.purpose ?? "Personal",
          type: type.name);

      try {
        AccountCommunityDomain? community =
            await getPrimaryAccountCommunity(true);

        if (community == null) {
          emit(state.copyWith(loading: false));
          return;
        }

        param = param.copyWith(
            community: community.community!.id!, member: community.id!);

        if (type == InviteType.single) {
          DateTime start = _startDate!.withTime(_startTime!);
          DateTime end = start.add(Duration(hours: state.validity));

          String accessCode = await totp.generateHourOtp(
              secret: community.id!,
              code: community.code!,
              start: start,
              hours: state.validity);

          param = param.copyWith(
              start: start.toUtc().toIso8601String(),
              end: end.toUtc().toIso8601String(),
              startDate: start,
              endDate: end,
              code: accessCode);
        } else {
          DateTime startDate =
              DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
          DateTime endDate =
              DateTime(_endDate!.year, _endDate!.month, _endDate!.day);
          String accessCode = await totp.generateDayOtp(
              secret: community.id!,
              code: community.code!,
              start: startDate,
              end: endDate);

          param = param.copyWith(
              start: startDate.toUtc().toIso8601String(),
              end: endDate.toUtc().toIso8601String(),
              startDate: startDate,
              endDate: endDate,
              code: accessCode);
        }

        await sendInvite(param);
        InviteDomain invite = InviteDomain(
            community: community,
            code: param.code!,
            type: type,
            name: param.name!.trim(),
            purpose: param.reason!.trim(),
            startDate: param.startDate!,
            endDate: param.endDate!,
            status: 'pending');

        emit(state.copyWith(
            loading: false, showDetailsScreen: Resettable(invite)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
