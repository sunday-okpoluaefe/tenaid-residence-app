part of 'visitor_screen_bloc.dart';

sealed class VisitorScreenState extends Equatable {
  const VisitorScreenState();
}

final class VisitorScreenInitial extends VisitorScreenState {
  @override
  List<Object> get props => [];
}
