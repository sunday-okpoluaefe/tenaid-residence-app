part of 'add_access_point_bloc.dart';

sealed class AddAccessPointEvent extends Equatable {
  const AddAccessPointEvent();
}

class OnNamedChanged extends AddAccessPointEvent {
  final String name;

  OnNamedChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class OnPasswordChanged extends AddAccessPointEvent {
  final String password;

  OnPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class OnDescriptionChanged extends AddAccessPointEvent {
  final String description;

  OnDescriptionChanged({required this.description});

  @override
  List<Object?> get props => [description];
}

class OnContinueClicked extends AddAccessPointEvent {
  @override
  List<Object?> get props => [];
}
