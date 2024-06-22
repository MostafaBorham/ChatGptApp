import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/widgets/custom_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatAnswerBoxOptions extends StatelessWidget {
  const ChatAnswerBoxOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: SvgPicture.asset(AppImages.imagesActiveLikeIcon,
            width: 17,
            height: 17,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
          ),),
        SizedBox(width: 16,),
        GestureDetector(
          onTap: (){},
          child: SvgPicture.asset(AppImages.imagesActiveDislikeIcon,
            width: 17,
            height: 17,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
          ),),
        SizedBox(width: 30,),
        GestureDetector(
          onTap: (){},
          child: CustomCopyWidget(),
        )
      ],
    );
  }
}