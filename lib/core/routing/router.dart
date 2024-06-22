import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/ui/views/conversation/conversation_screen.dart';
import 'package:chat_gpt_app/ui/views/dashboard/dashboard_screen.dart';
import 'package:chat_gpt_app/ui/views/splash_screen.dart';
import 'package:chat_gpt_app/ui/views/test_screen.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return CupertinoPageRoute(builder: (_) => const SplashScreen());
    ////////////////////////////////////////////////////////////////
    case AppRoutes.welcomeScreen:
      return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
  ////////////////////////////////////////////////////////////////
    case AppRoutes.dashboardScreen:
      return CupertinoPageRoute(builder: (_) => const DashboardScreen());
  ////////////////////////////////////////////////////////////////
    case AppRoutes.conversationScreen:
      return CupertinoPageRoute(builder: (_) => ConversationScreen(chat: (settings.arguments as Chat),));
  ////////////////////////////////////////////////////////////////
    case AppRoutes.testScreen:
      return CupertinoPageRoute(builder: (_) => const TestScreen());
    ////////////////////////////////////////////////////////////////
/*    case AppRoutes.conversationScreen:
      return CupertinoPageRoute(builder: (_) =>  ConversationScreen(conversationModel: (settings.arguments as Map)['conversation'],));*/
    ////////////////////////////////////////////////////////////////
    default:
      return CupertinoPageRoute(builder: (_) => const SizedBox.shrink());
  }
}
