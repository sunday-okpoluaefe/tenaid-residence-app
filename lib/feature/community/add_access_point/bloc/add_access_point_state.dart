part of 'add_access_point_bloc.dart';

@CopyWith(skipFields: true)
class AddAccessPointState extends Equatable {
  final bool loading;
  final String name;
  final String description;
  final String password;
  final bool validated;
  final Resettable<ApiException>? error;
  final Resettable<bool>? completed;

  AddAccessPointState(
      {this.loading = false,
      this.error,
      this.validated = false,
      this.completed,
      this.name = '',
      this.description = '',
      this.password = ''});

  @override
  List<Object?> get props =>
      [loading, error, completed, validated, password, name, description];
}
