part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable{
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class LoadingChatsHistoryState extends DashboardState{
  @override
  List<Object?> get props => [];
}

class FailGetChatsHistoryState extends DashboardState{

  final String failMessage;

  FailGetChatsHistoryState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}

class SuccessGetChatsHistoryState extends DashboardState{

  @override
  List<Object?> get props => [
  ];
}

class LoadingMoreChatsHistoryState extends DashboardState{
  @override
  List<Object?> get props => [];
}

class FailLoadMoreChatsHistoryState extends DashboardState{

  final String failMessage;

  FailLoadMoreChatsHistoryState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}

class SuccessLoadMoreChatsHistoryState extends DashboardState{

  @override
  List<Object?> get props => [
  ];
}

class WaitingAddingNewChatState extends DashboardState{
  @override
  List<Object?> get props => [];
}

class FailAddingNewChatState extends DashboardState{

  final String failMessage;

  FailAddingNewChatState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}

class SuccessAddingNewChatState extends DashboardState{

  final Chat chat;


  SuccessAddingNewChatState({required this.chat});

  @override
  List<Object?> get props => [
  ];
}

class LoadingClearConversationState extends DashboardState{
  @override
  List<Object?> get props => [];
}

class FailClearConversationsState extends DashboardState{

  final String failMessage;

  FailClearConversationsState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}

class SuccessClearConversationsState extends DashboardState{

  @override
  List<Object?> get props => [
  ];
}

class LoadingDeleteSingleChatState extends DashboardState{
  @override
  List<Object?> get props => [];
}

class FailDeleteSingleChatsState extends DashboardState{

  final String failMessage;

  FailDeleteSingleChatsState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}

class SuccessDeleteSingleChatsState extends DashboardState{

  @override
  List<Object?> get props => [
  ];
}