import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCopyWidget extends StatelessWidget {
  const CustomCopyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.imagesCopyIcon,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
        ),
        SizedBox(width: 10,),
        AutoSizeText('Copy',style: AppStyles.getSemiBoldStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ],
    );
  }
}