part of 'list_community_bloc.dart';

@CopyWith(skipFields: true)
class ListCommunityState extends Equatable {
  final bool loading;
  final List<AccountCommunityDomain> communities;
  final bool error;

  ListCommunityState(
      {this.loading = false, this.communities = const [], this.error = false});

  @override
  List<Object?> get props => [loading, communities, error];
}
