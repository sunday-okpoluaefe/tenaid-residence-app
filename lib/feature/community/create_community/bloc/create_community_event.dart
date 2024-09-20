part of 'create_community_bloc.dart';

sealed class CreateCommunityEvent extends Equatable {
  const CreateCommunityEvent();
}

class OnNamedChanged extends CreateCommunityEvent {
  final String name;

  OnNamedChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnDescriptionChanged extends CreateCommunityEvent {
  final String description;

  OnDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}
