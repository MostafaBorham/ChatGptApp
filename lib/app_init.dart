import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/controllers/conversation/conversation_bloc.dart';
import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/core/routing/router.dart';
import 'package:chat_gpt_app/core/services/di.dart';
import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/resources/app_responsive.dart';
import 'ui/resources/app_themes.dart';

class ChatGptApp extends StatelessWidget {
  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.context = context;

    /// Responsive Init
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjector.instance<AppConfigsBloc>()),
        BlocProvider(create: (context)=>DependencyInjector.instance<ConversationBloc>()),
        BlocProvider(create: (context)=>DependencyInjector.instance<DashboardBloc>()),
        BlocProvider(create: (context)=>DependencyInjector.instance<WelcomeBloc>()),
      ],
      child: BlocBuilder<AppConfigsBloc, AppConfigsState>(
          builder: (context, state) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: AppThemes.getLightModeTheme(),
          darkTheme: AppThemes.getDarkModeTheme(),
          themeMode: AppConfigsBloc.appMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          onGenerateRoute: onGenerate,
          initialRoute: AppRoutes.dashboardScreen,
        );
      }),
    );
  }
}
