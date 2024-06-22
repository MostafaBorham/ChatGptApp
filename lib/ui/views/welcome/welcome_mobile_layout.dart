import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_page_view.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_footer_section.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_header_section.dart';
import 'package:flutter/material.dart';

class WelcomeMobileLayout extends StatefulWidget {
  const WelcomeMobileLayout({super.key});

  @override
  State<WelcomeMobileLayout> createState() => _WelcomeMobileLayoutState();
}

class _WelcomeMobileLayoutState extends State<WelcomeMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const WelcomeHeaderSection(),
            SizedBox(
              height: 70.h(),
            ),
            const ChatGptFeaturePageView(),
            SizedBox(
              height: 70.h(),
            ),
            const WelcomeFooterSection(),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
