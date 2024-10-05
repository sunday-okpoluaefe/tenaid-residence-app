part of 'create_community_street_bloc.dart';

sealed class CreateCommunityStreetEvent extends Equatable {
  const CreateCommunityStreetEvent();
}

class OnNameChanged extends CreateCommunityStreetEvent {
  final String name;

  OnNameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class OnDescriptionChanged extends CreateCommunityStreetEvent {
  final String description;

  OnDescriptionChanged({required this.description});

  @override
  List<Object?> get props => [description];
}

class OnContinueClicked extends CreateCommunityStreetEvent {
  final String community;

  OnContinueClicked(this.community);

  @override
  List<Object?> get props => [community];
}
