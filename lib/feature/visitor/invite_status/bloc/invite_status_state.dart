part of 'invite_status_bloc.dart';

@CopyWith(skipFields: true)
class InviteStatusState extends Equatable {
  final bool loading;
  final VisitorDomain? visitor;
  final bool hasError;
  final Resettable<Pair<VisitorDomain, String>>? completed;

  InviteStatusState(
      {this.loading = false,
      this.visitor,
      this.hasError = false,
      this.completed});

  @override
  List<Object?> get props => [loading, visitor, hasError, completed];
}
