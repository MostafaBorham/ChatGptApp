part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetChatsHistoryEvent extends DashboardEvent{
  @override
  List<Object?> get props => [];
}

class LoadMoreChatsHistoryEvent extends DashboardEvent{
  @override
  List<Object?> get props => [];
}

class AddNewChatEvent extends DashboardEvent{
  @override
  List<Object?> get props => [];
}

class ClearConversationsEvent extends DashboardEvent{
  @override
  List<Object?> get props => [];
}

class DeleteSingleChatEvent extends DashboardEvent{

  final String chatId;


  DeleteSingleChatEvent({required this.chatId});

  @override
  List<Object?> get props => [];
}