part of 'create_community_street_bloc.dart';

@CopyWith(skipFields: true)
class CreateCommunityStreetState extends Equatable {
  final bool loading;
  final String name;
  final String description;
  final Resettable<ApiException>? error;
  final Resettable<bool>? completed;

  CreateCommunityStreetState(
      {this.loading = false,
      this.name = '',
      this.description = '',
      this.error,
      this.completed});

  @override
  List<Object?> get props => [loading, name, description, completed, error];
}
