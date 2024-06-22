import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'semi_bold_labeled_icon.dart';

class ConversationHeader extends StatelessWidget {
  const ConversationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SemiBoldLabeledIcon(label: AppStrings.backKey, icon: context.locale==englishLocale? AppImages.imagesBackArrowIcon : AppImages.imagesForwardArrowIcon,iconW: 6.75,),
        ),
        const ChatGptLogo()
      ],
    );
  }
}