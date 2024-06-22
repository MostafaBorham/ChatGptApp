import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/controllers/conversation/conversation_bloc.dart';
import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/views/conversation/conversation_desktop_layout.dart';
import 'package:chat_gpt_app/ui/views/conversation/conversation_mobile_layout.dart';
import 'package:chat_gpt_app/ui/views/conversation/conversation_tablet_layout.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_desktop_layout.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_mobile_layout.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_tablet_layout.dart';
import 'package:chat_gpt_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:chat_gpt_app/ui/widgets/app_mode_button.dart';
import 'package:chat_gpt_app/ui/widgets/custom_app_bar.dart';
import 'package:chat_gpt_app/ui/widgets/language_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key, required this.chat});

  final Chat chat;
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(leading: SizedBox.shrink(),),
      body: SafeArea(
        child: BlocProvider<ConversationBloc>(
  create: (context) => ConversationBloc()..chat=widget.chat..x=1,
  child: AdaptiveLayout(
          mobileLayout: (context) =>  ConversationMobileLayout(),
          tabletLayout: (context) => const ConversationTabletLayout(),
          desktopLayout: (context) => const ConversationDesktopLayout(),
        ),
),
      ),
    );
  }
}
