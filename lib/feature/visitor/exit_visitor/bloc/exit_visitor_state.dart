part of 'exit_visitor_bloc.dart';

@CopyWith(skipFields: true)
class ExitVisitorState extends Equatable {
  final bool loading;
  final String name;
  final String purpose;
  final DateTime? startTime;
  final Resettable<bool>? hasError;
  final Resettable<InviteDomain>? showDetailsScreen;

  ExitVisitorState(
      {this.loading = false,
      this.startTime,
      this.showDetailsScreen,
      this.hasError,
      this.name = '',
      this.purpose = ''});

  @override
  List<Object?> get props =>
      [showDetailsScreen, loading, startTime, hasError, name, purpose];
}
