import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_logo.dart';
import 'package:flutter/material.dart';

class FullChatGptLogo extends StatefulWidget {
  const FullChatGptLogo({
    super.key,
    required this.onAnimationEnd,
  });

  final Function onAnimationEnd;

  @override
  State<FullChatGptLogo> createState() => _FullChatGptLogoState();
}

class _FullChatGptLogoState extends State<FullChatGptLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.forward();
    animationController.addListener(_animationListener);
  }

  @override
  void dispose() {
    animationController.removeListener(_animationListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
            turns: animation,
            child:  ChatGptLogo(
              logoH: 100.w(),
              logoW: 100.w(),
            )),
        const SizedBox(
          height: 30,
        ),
        AutoSizeText(
          AppStrings.appName,
          style: AppStyles.getBoldStyle(
              color: Theme.of(context).colorScheme.onPrimaryFixed, fontSize: 50.s()),
        ),
      ],
    );
  }

  _animationListener() {
    if (animationController.isCompleted) {
      widget.onAnimationEnd();
    }
  }
}
