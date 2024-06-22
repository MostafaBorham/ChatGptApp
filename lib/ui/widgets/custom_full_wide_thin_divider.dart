import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:flutter/material.dart';

class CustomFullWideThinDivider extends StatelessWidget {
  const CustomFullWideThinDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.w(),
      thickness: 1.w(),
      color: Theme.of(context).colorScheme.outline,
    );
  }
}
