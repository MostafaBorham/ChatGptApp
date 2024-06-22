import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/core/services/di.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_desktop_layout.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_mobile_layout.dart';
import 'package:chat_gpt_app/ui/views/welcome/welcome_tablet_layout.dart';
import 'package:chat_gpt_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:chat_gpt_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final WelcomeBloc _welcomeBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (context) {
        _welcomeBloc=WelcomeBloc.getInstance(context);
        return DependencyInjector.instance<WelcomeBloc>();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Center(
          child: SafeArea(
            child: AdaptiveLayout(
              mobileLayout: (context) => const WelcomeMobileLayout(),
              tabletLayout: (context) => const WelcomeTabletLayout(),
              desktopLayout: (context) => const WelcomeDesktopLayout(),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _welcomeBloc.close();
    super.dispose();
  }
}
