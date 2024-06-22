import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/core/services/di.dart';
import 'package:chat_gpt_app/ui/views/dashboard/dashboard_desktop_layout.dart';
import 'package:chat_gpt_app/ui/views/dashboard/dashboard_mobile_layout.dart';
import 'package:chat_gpt_app/ui/views/dashboard/dashboard_tablet_layout.dart';
import 'package:chat_gpt_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:chat_gpt_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardBloc _dashboardBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => _dashboardBloc = DependencyInjector.instance<
          DashboardBloc>() ..add(GetChatsHistoryEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: RefreshIndicator(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            backgroundColor: Theme.of(context).colorScheme.error,
            onRefresh: () async {
              _dashboardBloc.add(GetChatsHistoryEvent());
            },
            child: AdaptiveLayout(
              mobileLayout: (context) => const DashboardMobileLayout(),
              tabletLayout: (context) => const DashboardTabletLayout(),
              desktopLayout: (context) => const DashboardDesktopLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
