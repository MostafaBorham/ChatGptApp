import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MediumLabeledIcon extends StatelessWidget {
  const MediumLabeledIcon({
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
        SizedBox(
          width: 200.w(),
          child: AutoSizeText(
            label,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.getMediumStyle(
              color: color ?? Theme.of(context).colorScheme.onPrimaryFixed,
              fontSize: 16.s(),
            ),
          ),
        ),
      ],
    );
  }
}
