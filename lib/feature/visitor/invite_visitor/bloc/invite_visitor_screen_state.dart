part of 'invite_visitor_screen_bloc.dart';

enum InviteType { single, extended }

@CopyWith(skipFields: true)
class InviteVisitorScreenState extends Equatable {
  final bool validated;
  final bool loading;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? dateTimeString;
  final String? dateString;
  final bool startTimeError;
  final bool endDateError;
  final TimeOfDay? startTime;
  final int validity;
  final InviteType type;
  final String? name;
  final String? purpose;
  final Resettable<ApiException>? error;
  final Resettable<InviteDomain>? showDetailsScreen;

  InviteVisitorScreenState(
      {this.validated = false,
      this.loading = false,
      this.dateTimeString = '',
      this.dateString = '',
      this.error,
      this.showDetailsScreen,
      this.startTimeError = false,
      this.endDateError = false,
      this.startDate,
      this.startTime,
      this.endDate,
      this.type = InviteType.single,
      this.validity = 1,
      this.name,
      this.purpose});

  @override
  List<Object?> get props => [
        validated,
        showDetailsScreen,
        startTimeError,
        endDateError,
        startDate,
        endDate,
        dateString,
        error,
        startTime,
        validity,
        name,
        purpose,
        loading,
        type,
        dateTimeString
      ];
}
