part of 'visitor_detail_bloc.dart';

sealed class VisitorDetailEvent extends Equatable {
  const VisitorDetailEvent();
}

class OnLoadActivities extends VisitorDetailEvent {
  final String invite;
  final int page;
  final int limit;

  OnLoadActivities(
      {required this.invite, required this.page, required this.limit});

  @override
  List<Object?> get props => [invite, page, limit];
}

class OnGenerateExitCode extends VisitorDetailEvent {
  final VisitorDomain visitor;

  OnGenerateExitCode(this.visitor);

  @override
  List<Object?> get props => [];
}
