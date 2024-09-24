part of 'community_detail_bloc.dart';

@CopyWith(skipFields: true)
class CommunityDetailState extends Equatable {
  final bool loading;
  final Resettable<ApiException>? error;
  final AccountCommunityDomain? community;

  CommunityDetailState({this.loading = false, this.error, this.community});

  @override
  List<Object?> get props => [loading, error, community];
}
