import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoldLabeledIcon extends StatelessWidget {
  const BoldLabeledIcon({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    this.iconW,
    this.iconH,
  });
  final String label;
  final String icon;
  final Color? color;
  final double? iconW;
  final double? iconH;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          width: iconW ?? 20.w(),
          height: iconH ?? 20.w(),
          colorFilter: ColorFilter.mode(
              color ?? Theme.of(context).colorScheme.onPrimaryFixed,
              BlendMode.srcIn),
        ),
        const SizedBox(
          width: 16,
        ),
        AutoSizeText(
          label.tr(),
          textAlign: TextAlign.center,
          style: AppStyles.getBoldStyle(
              color: color ?? Theme.of(context).colorScheme.onPrimaryFixed,
              fontSize: 16.s()),
        ),
      ],
    );
  }
}
