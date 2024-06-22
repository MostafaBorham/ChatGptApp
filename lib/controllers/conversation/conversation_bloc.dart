import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/data/network/repo.dart';
import 'package:chat_gpt_app/core/extensions/list.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/domains/mappers/chat_mapper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  late Chat chat;
  int x = 0;
  static ConversationBloc getInstance(BuildContext context) =>
      BlocProvider.of<ConversationBloc>(context);
  ConversationBloc() : super(ConversationInitial()) {
    on<AskChatGptEvent>(_askChatGpt);
  }

  Future<FutureOr<void>> _askChatGpt(
      AskChatGptEvent event, Emitter<ConversationState> emit) async {
    chat = chat.copyWith(newTitle: event.question);
    var newChatItem = ChatQuestionAndAnswer(
        id: '1', question: event.question, isLiked: false, isAnswered: false);
    chat.chats.add(newChatItem);
    emit(LoadingChatGptAnswerState());
    final result = await NetworkRepo.askChatGpt(question: event.question);

    result.fold((failure) {
      chat.chats.updateItem(
          oldItem: newChatItem,
          newItem: newChatItem.copyWith(
            newAnswer: failure.message,
          ));
      _saveChat();
      emit(FailChatGptAnswerState(failMessage: failure.message!));
    }, (answer) {
      chat.chats.updateItem(
          oldItem: newChatItem,
          newItem: newChatItem.copyWith(
            newAnswer: answer,
            newIsAnswered: true,
          ));
      _saveChat();
      emit(SuccessChatGptAnswerState(answer: answer));
    });
  }

  Future<void> _saveChat() async {
    await NetworkRepo.saveChat(chat: chat.toModel());
  }
}
