part of 'conversation_bloc.dart';

@immutable
abstract class ConversationEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AskChatGptEvent extends ConversationEvent {
  final String question;

  AskChatGptEvent({required this.question});

  @override
  List<Object?> get props => [
    question,
  ];
}