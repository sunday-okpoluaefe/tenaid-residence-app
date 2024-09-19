part of 'join_community_screen_bloc.dart';

sealed class JoinCommunityNavState {
  const JoinCommunityNavState();
}

final class ShowStreetScreen extends JoinCommunityNavState {
  final CommunityDomain community;

  ShowStreetScreen(this.community);
}

final class ShowSearchScreen extends JoinCommunityNavState {}

@CopyWith(skipFields: true)
class JoinCommunityScreenState extends Equatable {
  final bool loading;
  final bool validated;
  final CommunityDomain? selected;
  final Resettable<bool>? errorMessage;
  final Resettable<JoinCommunityNavState>? nav;

  JoinCommunityScreenState(
      {this.selected,
      this.loading = false,
      this.errorMessage,
      this.nav,
      this.validated = false});

  @override
  List<Object?> get props => [loading, errorMessage, nav, selected, validated];
}
