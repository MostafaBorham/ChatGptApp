import 'package:chat_gpt_app/controllers/conversation/conversation_bloc.dart';
import 'package:chat_gpt_app/ui/widgets/chat_answer_box.dart';
import 'package:chat_gpt_app/ui/widgets/chat_typing_box.dart';
import 'package:chat_gpt_app/ui/widgets/chat_question_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBoxList extends StatefulWidget {
  const ChatBoxList({
    super.key, required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<ChatBoxList> createState() => _ChatBoxListState();
}

class _ChatBoxListState extends State<ChatBoxList> {

  @override
  void initState() {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.scrollController.animateTo(
        duration: Duration(milliseconds: 1),
        widget.scrollController.position.maxScrollExtent, curve: Curves.linear,
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationBloc, ConversationState>(
      listener: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          widget.scrollController.animateTo(
            duration: Duration(milliseconds: 1),
            widget.scrollController.position.maxScrollExtent, curve: Curves.linear,
          );
        });
      },
      builder: (context, state) {
        return ListView.separated(
            reverse: false,
            controller: widget.scrollController,
            itemBuilder: (context, index) {
              var chatItem =
                  ConversationBloc.getInstance(context).chat.chats[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: chatItem.answer == null
                          ? ChatTypingBox()
                          : ChatAnswerBox(
                              answer: chatItem.answer!,
                              color: chatItem.isAnswered
                                  ? Theme.of(context).colorScheme.onBackground
                                  : Theme.of(context).colorScheme.error,
                            )),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: ChatQuestionBox(question: chatItem.question)),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 30,
              );
            },
            itemCount: ConversationBloc.getInstance(context).chat.chats.length);
      },
    );
  }
}