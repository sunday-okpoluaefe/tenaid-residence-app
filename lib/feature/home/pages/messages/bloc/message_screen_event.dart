part of 'message_screen_bloc.dart';

sealed class MessageScreenEvent extends Equatable {
  const MessageScreenEvent();
}

class OnInit extends MessageScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnGetUnreadMessages extends MessageScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnSendMessage extends MessageScreenEvent {
  final String body;
  final MessageType type;
  final String? description;
  final String? repliedTo;

  OnSendMessage(
      {required this.body,
      this.description,
      this.repliedTo,
      this.type = MessageType.text});

  @override
  List<Object?> get props => [body, description, repliedTo, type];
}

class OnMessageReceived extends MessageScreenEvent {
  final CommunityMessageDomain message;

  OnMessageReceived(this.message);

  @override
  List<Object?> get props => [message];
}

class OnMessagesReceived extends MessageScreenEvent {
  final List<CommunityMessageDomain> messages;

  OnMessagesReceived(this.messages);

  @override
  List<Object?> get props => [messages];
}
