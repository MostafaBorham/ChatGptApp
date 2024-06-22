import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/data/network/network_constants.dart';
import 'package:chat_gpt_app/core/data/network/repo.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/domains/mappers/chat_mapper.dart';
import 'package:chat_gpt_app/domains/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  List<Chat> chatsHistory = [];
  bool hasMoreHistory = true;
  bool isChatsHistoryLoadingMoreNow = false;
  int chatsHistoryPage = 1;

  static DashboardBloc getInstance(BuildContext context) =>
      BlocProvider.of<DashboardBloc>(context);
  DashboardBloc() : super(DashboardInitial()) {
    on<GetChatsHistoryEvent>(_getChatsHistory);
    on<LoadMoreChatsHistoryEvent>(_loadMoreChatsHistory);
    on<AddNewChatEvent>(_addNewChat);
    on<ClearConversationsEvent>(_clearConversations);
    on<DeleteSingleChatEvent>(_deleteSingleChat);
  }

  Future<FutureOr<void>> _getChatsHistory(
      GetChatsHistoryEvent event, Emitter<DashboardState> emit) async {
    _resetHistoryListPaginationParams();
    emit(LoadingChatsHistoryState());

    final result = await NetworkRepo.getChatsHistory();

    result.fold((failure) {
      emit(FailGetChatsHistoryState(failMessage: failure.message!));
    }, (chats) {
      chatsHistory.clear();
      chatsHistory.addAll(chats);
      emit(SuccessGetChatsHistoryState());
    });
  }

  Future<FutureOr<void>> _addNewChat(
      AddNewChatEvent event, Emitter<DashboardState> emit) async {
    emit(WaitingAddingNewChatState());
    final newChat = Chat(
        id: '',
        title: '',
        createdAt: Timestamp.now(),
        chats: List.empty(growable: true));
    final result = await NetworkRepo.addNewChat(chat: newChat.toModel());
    result.fold(
      (failure) {
        emit(FailAddingNewChatState(failMessage: failure.message!));
      },
      (newChat) {
        emit(SuccessAddingNewChatState(chat: newChat));
      },
    );
  }

  FutureOr<void> _clearConversations(
      ClearConversationsEvent event, Emitter<DashboardState> emit) async {
    emit(LoadingClearConversationState());
    final result = await NetworkRepo.clearConversations();

    result.fold(
      (failure) {
        emit(FailClearConversationsState(failMessage: failure.message!));
      },
      (_) {
        chatsHistory.clear();
        emit(SuccessClearConversationsState());
      },
    );
  }

  FutureOr<void> _deleteSingleChat(
      DeleteSingleChatEvent event, Emitter<DashboardState> emit) async {
    emit(LoadingDeleteSingleChatState());
    final result = await NetworkRepo.deleteSingleChat(chatId: event.chatId);

    result.fold(
      (failure) {
        emit(FailDeleteSingleChatsState(failMessage: failure.message!));
      },
      (_) {
        chatsHistory.removeWhere(
          (chat) => chat.id == event.chatId,
        );
        emit(SuccessDeleteSingleChatsState());
      },
    );
  }

  FutureOr<void> _loadMoreChatsHistory(
      LoadMoreChatsHistoryEvent event, Emitter<DashboardState> emit) async {
    if (hasMoreHistory && !isChatsHistoryLoadingMoreNow) {
      emit(LoadingMoreChatsHistoryState());
      isChatsHistoryLoadingMoreNow = !isChatsHistoryLoadingMoreNow;
      final result =
          await NetworkRepo.getChatsHistory(page: ++chatsHistoryPage);
      isChatsHistoryLoadingMoreNow = !isChatsHistoryLoadingMoreNow;
      result.fold((failure) {
        emit(FailLoadMoreChatsHistoryState(failMessage: failure.message!));
      }, (chats) {
        chatsHistory.addAll(chats);
        if (chats.length < chatsHistoryPageSize) {
          hasMoreHistory = false;
        }
        emit(SuccessLoadMoreChatsHistoryState());
      });
    }
  }

  void _resetHistoryListPaginationParams() {
    hasMoreHistory = true;
    isChatsHistoryLoadingMoreNow = false;
    chatsHistoryPage = 1;
  }
}
