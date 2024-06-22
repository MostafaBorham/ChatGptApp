import 'dart:async';

import 'package:chat_gpt_app/ui/widgets/custom_dots_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChatTypingBox extends StatelessWidget {
  const ChatTypingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 43,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(8),
          topStart: Radius.circular(8),
          topEnd: Radius.circular(8),
        ),
      ),
      child: CustomDotsLoading(
        dotsCount: 3,
        dotHeight: 9,
        dotWidth: 9,
        dotRadius: 12,
        spacing: 5,
        activeDotColor: Theme.of(context).colorScheme.surface,
        dotColor: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
