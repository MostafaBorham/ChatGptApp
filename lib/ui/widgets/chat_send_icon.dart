import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatSendIcon extends StatelessWidget {
  const ChatSendIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: SvgPicture.asset(AppImages.imagesSendQuestionIcon,fit: BoxFit.contain,width: 20,height: 20,),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}