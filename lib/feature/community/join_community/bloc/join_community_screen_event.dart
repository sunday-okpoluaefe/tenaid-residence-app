part of 'join_community_screen_bloc.dart';

sealed class JoinCommunityScreenEvent extends Equatable {
  const JoinCommunityScreenEvent();
}

class OnSearch extends JoinCommunityScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnContinue extends JoinCommunityScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnCommunitySelected extends JoinCommunityScreenEvent {
  final CommunityDomain community;

  OnCommunitySelected(this.community);

  @override
  List<Object?> get props => [community];
}
