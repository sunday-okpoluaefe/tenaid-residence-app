part of 'message_screen_bloc.dart';

@CopyWith(skipFields: true)
class MessageScreenState extends Equatable {
  final bool loading;
  final AuthorDomain? user;
  final List<CommunityMessageDomain> messages;

  MessageScreenState(
      {this.loading = true, this.user, this.messages = const []});

  @override
  List<Object?> get props => [loading, messages, user];
}
