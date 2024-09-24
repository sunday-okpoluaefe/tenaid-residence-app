part of 'community_street_bloc.dart';

sealed class CommunityStreetEvent extends Equatable {
  const CommunityStreetEvent();
}

class OnLoadStreets extends CommunityStreetEvent {
  final String community;
  final int page;
  final int limit;

  OnLoadStreets(
      {required this.page, required this.limit, required this.community});

  @override
  List<Object?> get props => [page, limit, community];
}
