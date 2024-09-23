part of 'pending_join_request_bloc.dart';

sealed class PendingJoinRequestEvent extends Equatable {
  const PendingJoinRequestEvent();
}

class OnLoadRequests extends PendingJoinRequestEvent {
  final int page;
  final int limit;

  OnLoadRequests({required this.page, required this.limit});

  @override
  List<Object?> get props => [page, limit];
}

class OnGetPrimaryCommunity extends PendingJoinRequestEvent {
  @override
  List<Object?> get props => [];
}
