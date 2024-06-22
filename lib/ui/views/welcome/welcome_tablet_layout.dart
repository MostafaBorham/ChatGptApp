
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTabletLayout extends StatelessWidget {
  const WelcomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(' Welcome Tablet',style: AppStyles.getThickStyle(fontSize: 40),),
    );
  }
}
