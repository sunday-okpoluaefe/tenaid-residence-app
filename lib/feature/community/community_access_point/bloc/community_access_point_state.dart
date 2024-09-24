part of 'community_access_point_bloc.dart';

@CopyWith(skipFields: true)
class CommunityAccessPointState extends Equatable {
  final bool loading;
  final bool error;
  final List<AccessPointDomain> accessPoints;

  CommunityAccessPointState(
      {this.loading = false, this.error = false, this.accessPoints = const []});

  @override
  List<Object?> get props => [loading, error, accessPoints];
}
