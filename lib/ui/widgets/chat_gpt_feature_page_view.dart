import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_item.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class ChatGptFeaturePageView extends StatelessWidget {
  const ChatGptFeaturePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: WelcomeBloc.getInstance(context).pageController,
        children: List.generate(
            WelcomeBloc.features.length,
            (index) => ChatGptFeatureItem(
                  feature: WelcomeBloc.features[index],
                )));
  }
}
