import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcome_navigation_button.dart';

class WelcomeFooterSection extends StatelessWidget {
  const WelcomeFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothPageIndicator(
          controller: WelcomeBloc.getInstance(context).pageController,
          count: WelcomeBloc.features.length,
          effect: SlideEffect(
            dotHeight: 2.s(),
            dotWidth: 28.s(),
            radius: 12.s(),
            spacing: 12,
            activeDotColor: Theme.of(context).colorScheme.surface,
            dotColor: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const AspectRatio(
            aspectRatio: 7,
            child: WelcomeNavigationButton()),
      ],
    );
  }
}
