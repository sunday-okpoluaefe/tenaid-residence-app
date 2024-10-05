part of 'exit_visitor_bloc.dart';

sealed class ExitVisitorEvent extends Equatable {
  const ExitVisitorEvent();
}

class OnNameChanged extends ExitVisitorEvent {
  final String name;

  OnNameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class OnContinueClicked extends ExitVisitorEvent {
  @override
  List<Object?> get props => [];
}

class OnPurposeChanged extends ExitVisitorEvent {
  final String purpose;

  OnPurposeChanged({required this.purpose});

  @override
  List<Object?> get props => [purpose];
}
