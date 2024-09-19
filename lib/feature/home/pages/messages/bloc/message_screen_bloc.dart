import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'message_screen_event.dart';
part 'message_screen_state.dart';

@injectable
class MessageScreenBloc extends Bloc<MessageScreenEvent, MessageScreenState> {
  MessageScreenBloc() : super(MessageScreenInitial()) {
    on<MessageScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
