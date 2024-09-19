part of 'visitors_list_screen_bloc.dart';

enum ListType { all, today, upcoming }

sealed class VisitorsListScreenEvent extends Equatable {
  const VisitorsListScreenEvent();
}

class OnLoadVisitors extends VisitorsListScreenEvent {
  final int page;
  final int limit;
  final ListType type;

  OnLoadVisitors({this.page = 1, this.limit = 10, this.type = ListType.all});

  @override
  List<Object?> get props => [page, limit, type];
}
