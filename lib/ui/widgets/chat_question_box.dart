import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class ChatQuestionBox extends StatelessWidget {
  const ChatQuestionBox({
    super.key, required this.question,
  });

  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 267,
      padding: EdgeInsetsDirectional.all(10),
      child: AutoSizeText(question,style: AppStyles.getSemiBoldStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onBackground
      ),),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(8),topStart: Radius.circular(8),topEnd: Radius.circular(8),),

      ),
    );
  }
}