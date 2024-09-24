part of 'community_detail_bloc.dart';

sealed class CommunityDetailEvent extends Equatable {
  const CommunityDetailEvent();
}

class OnSetPrimaryClicked extends CommunityDetailEvent {
  @override
  List<Object?> get props => [];
}

class OnInit extends CommunityDetailEvent {
  final AccountCommunityDomain community;

  OnInit(this.community);

  @override
  List<Object?> get props => [community];
}
