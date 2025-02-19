import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppModeButton extends StatelessWidget {
  const AppModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigsBloc, AppConfigsState>(
        builder: (context, state) {
      return AppConfigsBloc.appMode == ThemeMode.dark
          ? IconButton(
              onPressed: () {
                AppConfigsBloc.getInstance(context).add(LightModeEvent());
              },
              icon: const Icon(Icons.light_mode),
              color: Theme.of(context).colorScheme.error,
            )
          : IconButton(
              onPressed: () {
                AppConfigsBloc.getInstance(context).add(DarkModeEvent());
              },
              icon: const Icon(Icons.dark_mode),
              color: Theme.of(context).colorScheme.error,
            );
    });
  }
}
