part of 'visitors_list_screen_bloc.dart';

@CopyWith(skipFields: true)
class VisitorsListScreenState extends Equatable {
  final Resettable<PaginatedResult>? visitors;
  final bool loading;
  final Resettable<ApiException>? error;

  VisitorsListScreenState({this.visitors, this.loading = false, this.error});

  @override
  List<Object?> get props => [visitors, loading, error];
}
