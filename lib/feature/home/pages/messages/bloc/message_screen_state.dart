part of 'message_screen_bloc.dart';

sealed class MessageScreenState extends Equatable {
  const MessageScreenState();
}

final class MessageScreenInitial extends MessageScreenState {
  @override
  List<Object> get props => [];
}
