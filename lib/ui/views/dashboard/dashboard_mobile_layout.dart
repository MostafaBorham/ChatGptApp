import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/widgets/chat_list_view.dart';
import 'package:chat_gpt_app/ui/widgets/circular_loader.dart';
import 'package:chat_gpt_app/ui/widgets/custom_full_wide_thin_divider.dart';
import 'package:chat_gpt_app/ui/widgets/dashboard_options_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardMobileLayout extends StatelessWidget {
  const DashboardMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 0.55.hRatio(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state is LoadingChatsHistoryState ||
                        state is LoadingClearConversationState ||
                        state is LoadingDeleteSingleChatState ||
                        state is LoadingClearConversationState
                    ? Center(
                        child: CircularLoader(
                        size: 40.s(),
                      ))
                    : const ChatListView(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: CustomFullWideThinDivider(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DashboardOptionsMenu(),
              ),
            ),
          ],
        );
      },
    );
  }
}
