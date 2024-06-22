import 'package:chat_gpt_app/ui/widgets/chats_history_list_view.dart';
import 'package:chat_gpt_app/ui/widgets/new_chat_item.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NewChatItem(),
        SizedBox(height: 12,),
        Expanded(child: ChatsHistoryListView()),
      ],
    );
  }
}