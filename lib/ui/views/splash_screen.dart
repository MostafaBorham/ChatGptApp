import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/ui/widgets/full_chat_gpt_logo.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: FullChatGptLogo(
            onAnimationEnd: (){
              Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen,);
            },
          ),
        ),
      ),
    );
  }
}
