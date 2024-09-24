part of 'community_access_point_bloc.dart';

sealed class CommunityAccessPointEvent extends Equatable {
  const CommunityAccessPointEvent();
}

class OnLoadAccessPoints extends CommunityAccessPointEvent {
  @override
  List<Object?> get props => [];
}
