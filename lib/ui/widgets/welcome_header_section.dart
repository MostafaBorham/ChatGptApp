import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_logo.dart';
import 'package:flutter/material.dart';

class WelcomeHeaderSection extends StatelessWidget {
  const WelcomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatGptLogo(),
        const SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            AppStrings.welcomeToChatGPT,
            textAlign: TextAlign.center,
            style: AppStyles.getBoldStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 32.s()),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            AppStrings.askAnythingGetYourAnswer,
            textAlign: TextAlign.center,
            style: AppStyles.getSemiBoldStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 16.s()),
          ),
        ),
      ],
    );
  }
}
