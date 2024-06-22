import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class LabeledAlert extends StatelessWidget {
  const LabeledAlert({
    super.key, required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.w(),
      width: 46.w(),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onError,
          borderRadius: BorderRadius.circular(8.s())
      ),
      child: AutoSizeText(label,textAlign: TextAlign.center,style: AppStyles.getSemiBoldStyle(
        fontSize: 12.s(),
        color: Theme.of(context).colorScheme.tertiary,
      ),),
    );
  }
}