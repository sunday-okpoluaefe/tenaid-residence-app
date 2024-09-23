part of 'join_request_detail_bloc.dart';

sealed class JoinRequestDetailEvent extends Equatable {
  const JoinRequestDetailEvent();
}

class OnInit extends JoinRequestDetailEvent {
  final String? request;
  final JoinRequestDomain? requestDetail;

  OnInit({this.request, this.requestDetail});

  @override
  List<Object?> get props => [requestDetail, request];
}

class OnApproveRequest extends JoinRequestDetailEvent {
  @override
  List<Object?> get props => [];
}
