part of 'conversation_bloc.dart';

@immutable
abstract class ConversationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConversationInitial extends ConversationState {}

class LoadingChatGptAnswerState extends ConversationState {
  @override
  List<Object?> get props => [];
}

class FailChatGptAnswerState extends ConversationState {
  final String failMessage;

  FailChatGptAnswerState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessChatGptAnswerState extends ConversationState {
  final String answer;

  SuccessChatGptAnswerState({required this.answer});

  @override
  List<Object?> get props => [
        answer,
      ];
}
