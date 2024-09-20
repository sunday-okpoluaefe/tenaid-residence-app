part of 'confirm_create_bloc.dart';

@CopyWith(skipFields: true)
class ConfirmCreateState extends Equatable {
  final bool loading;
  final CreateCommunityParam? param;
  final Resettable<ApiException>? error;
  final Resettable<bool>? completed;

  ConfirmCreateState(
      {this.loading = false, this.error, this.param, this.completed});

  @override
  List<Object?> get props => [loading, error, param, completed];
}
