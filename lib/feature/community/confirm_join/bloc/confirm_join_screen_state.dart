part of 'confirm_join_screen_bloc.dart';

@CopyWith(skipFields: true)
class ConfirmJoinScreenState extends Equatable {
  final bool loading;
  final bool isPrimary;
  final Resettable<ApiException>? error;
  final Resettable<AccountCommunityDomain>? success;

  ConfirmJoinScreenState(
      {this.isPrimary = false, this.loading = false, this.error, this.success});

  @override
  List<Object?> get props => [error, loading, success, isPrimary];
}
