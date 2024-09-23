part of 'list_community_bloc.dart';

sealed class ListCommunityEvent extends Equatable {
  const ListCommunityEvent();
}

class OnLoadCommunities extends ListCommunityEvent {
  @override
  List<Object?> get props => [];
}
