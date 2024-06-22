import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class ChatAnswerBoxMessage extends StatelessWidget {
  const ChatAnswerBoxMessage({
    super.key,
    required this.answer,
    required this.color,
  });

  final String answer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      padding: EdgeInsetsDirectional.all(10),
      child: AutoSizeText(answer,style: AppStyles.getSemiBoldStyle(
          fontSize: 16,
          color: color,
      ),),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(8),topStart: Radius.circular(8),topEnd: Radius.circular(8),),

      ),
    );
  }
}