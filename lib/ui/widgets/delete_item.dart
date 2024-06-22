import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteItem extends StatelessWidget {
  const DeleteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.imagesDeleteIcon,
          fit: BoxFit.contain,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.error,
              BlendMode.srcIn),
        ),
        SizedBox(
          width: 12,
        ),
        AutoSizeText(
          AppStrings.delete,
          textAlign: TextAlign.center,
          style: AppStyles.getMediumStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12),
        ),
      ],
    );
  }
}