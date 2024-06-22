import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class FeatureServiceBox extends StatelessWidget {
  const FeatureServiceBox({
    super.key,
    required this.serviceDetail,
  });
  final String serviceDetail;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(7.s()),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            serviceDetail,
            textAlign: TextAlign.center,
            style: AppStyles.getMediumStyle(
              fontSize: 16.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed,
            ),
          ),
        ),
      ),
    );
  }
}
