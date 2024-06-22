import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SemiBoldLabeledIcon extends StatelessWidget {
  const SemiBoldLabeledIcon({
    super.key, required this.label, required this.icon, this.color, this.iconW, this.iconH,
  });
  final String label;
  final String icon;
  final Color? color;
  final double? iconW;
  final double? iconH;
  @override
  Widget build(BuildContext context) {
    print('label= $label');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          width: iconW?? 12,
          height: iconH?? 12,
          colorFilter: ColorFilter.mode(color?? Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
        ),
        SizedBox(width: 12,),
        AutoSizeText(label.tr(),textAlign: TextAlign.center,style: AppStyles.getSemiBoldStyle(
            color: color?? Theme.of(context).colorScheme.onBackground,
            fontSize: 16
        ),),
      ],
    );
  }
}