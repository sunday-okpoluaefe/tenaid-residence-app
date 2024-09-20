part of 'create_community_bloc.dart';

@CopyWith(skipFields: true)
class CreateCommunityState extends Equatable {
  final String? name;
  final String? description;

  CreateCommunityState({this.name, this.description});

  @override
  List<Object?> get props => [name, description];
}
