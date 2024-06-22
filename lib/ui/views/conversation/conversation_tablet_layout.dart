import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_item.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_page_view.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_footer_section.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ConversationTabletLayout extends StatefulWidget {
  const ConversationTabletLayout({super.key});

  @override
  State<ConversationTabletLayout> createState() => _ConversationTabletLayoutState();
}

class _ConversationTabletLayoutState extends State<ConversationTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText('Conversation Tablet');
  }
}
