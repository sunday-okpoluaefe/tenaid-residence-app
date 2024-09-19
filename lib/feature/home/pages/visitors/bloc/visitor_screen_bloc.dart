import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'visitor_screen_event.dart';

part 'visitor_screen_state.dart';

@injectable
class VisitorScreenBloc extends Bloc<VisitorScreenEvent, VisitorScreenState> {
  VisitorScreenBloc() : super(VisitorScreenInitial()) {
    on<VisitorScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
