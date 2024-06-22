import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeNavigationButton extends StatelessWidget {
  const WelcomeNavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomeBloc,WelcomeState>(
      listener: (context,state){
        if(state is FeaturesPageEndState){
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboardScreen,(route) => false,);
        }
        else{
          WelcomeBloc.getInstance(context).pageController.animateToPage(
              WelcomeBloc.getInstance(context).currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        }
      },
      builder: (context,state) {
        return ElevatedButton(
            onPressed: () {
              WelcomeBloc.getInstance(context).add(FeaturesPageViewNavigationEvent());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.s()),
                )),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: AutoSizeText(
                  state is ReadyToLeaveFeaturesPageState || state is FeaturesPageEndState
                      ? AppStrings.letsChat : AppStrings.next,
                  textAlign: TextAlign.center,
                  style: AppStyles.getBoldStyle(
                      fontSize: 30.s(),
                      color: Theme.of(context).colorScheme.onPrimaryFixed)),
            ));
      }
    );
  }
}
