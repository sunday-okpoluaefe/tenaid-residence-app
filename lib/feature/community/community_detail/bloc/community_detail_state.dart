part of 'community_detail_bloc.dart';

sealed class CommunityDetailState extends Equatable {
  const CommunityDetailState();
}

final class CommunityDetailInitial extends CommunityDetailState {
  @override
  List<Object> get props => [];
}
