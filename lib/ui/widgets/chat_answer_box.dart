import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_answer_box_message.dart';
import 'package:chat_gpt_app/ui/widgets/chat_answer_box_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatAnswerBox extends StatelessWidget {
  const ChatAnswerBox({
    super.key, required this.answer, required this.color,
  });

  final String answer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ChatAnswerBoxMessage(answer: answer,color: color,),
        SizedBox(height: 12,),
        ChatAnswerBoxOptions()
      ],
    );
  }
}