part of 'visitor_detail_bloc.dart';

@CopyWith(skipFields: true)
class VisitorDetailState extends Equatable {
  final bool loading;
  final InviteDomain? invite;
  final PaginatedResult? activities;
  final bool hasError;

  VisitorDetailState(
      {this.loading = true,
      this.invite,
      this.activities,
      this.hasError = false});

  @override
  List<Object?> get props => [loading, invite, hasError, activities];
}
