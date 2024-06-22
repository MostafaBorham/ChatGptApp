import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatGptLogo extends StatelessWidget {
  const ChatGptLogo({super.key, this.logoW, this.logoH, this.logoColor});
  final double? logoW;
  final double? logoH;
  final Color? logoColor;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.imagesChatGptLogo,
      fit: BoxFit.contain,
      height: logoH ?? 24.s(),
      width: logoW ?? 24.s(),
      colorFilter: ColorFilter.mode(
          logoColor ?? Theme.of(context).colorScheme.onPrimaryFixed,
          BlendMode.srcIn),
    );
  }
}
