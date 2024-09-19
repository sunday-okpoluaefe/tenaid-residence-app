part of 'invite_visitor_screen_bloc.dart';

sealed class InviteVisitorScreenEvent extends Equatable {
  const InviteVisitorScreenEvent();
}

class OnStartDateChanged extends InviteVisitorScreenEvent {
  final DateTime dateTime;

  OnStartDateChanged(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class OnEndDateChanged extends InviteVisitorScreenEvent {
  final DateTime dateTime;

  OnEndDateChanged(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class OnTimeChanged extends InviteVisitorScreenEvent {
  final TimeOfDay timeOfDay;

  OnTimeChanged(this.timeOfDay);

  @override
  List<Object?> get props => [timeOfDay];
}

class OnNameChanged extends InviteVisitorScreenEvent {
  final String name;

  OnNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnPurposeChanged extends InviteVisitorScreenEvent {
  final String purpose;

  OnPurposeChanged(this.purpose);

  @override
  List<Object?> get props => [purpose];
}

class OnValidityChanged extends InviteVisitorScreenEvent {
  final int validity;

  OnValidityChanged(this.validity);

  @override
  List<Object?> get props => [validity];
}

class OnInviteTypeChanged extends InviteVisitorScreenEvent {
  final InviteType type;

  OnInviteTypeChanged(this.type);

  @override
  List<Object?> get props => [type];
}

class OnContinueClicked extends InviteVisitorScreenEvent {
  @override
  List<Object?> get props => [];
}
