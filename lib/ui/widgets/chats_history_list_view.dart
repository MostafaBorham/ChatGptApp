import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/widgets/chat_item.dart';
import 'package:chat_gpt_app/ui/widgets/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsHistoryListView extends StatefulWidget {
  const ChatsHistoryListView({
    super.key,
  });

  @override
  State<ChatsHistoryListView> createState() => _ChatsHistoryListViewState();
}

class _ChatsHistoryListViewState extends State<ChatsHistoryListView> {
  final listScrollController = ScrollController();

  @override
  void initState() {
    listScrollController.addListener(
      () {
        if (listScrollController.position.maxScrollExtent ==
            listScrollController.position.pixels) {
          DashboardBloc.getInstance(context).add(LoadMoreChatsHistoryEvent());
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: listScrollController,
                itemCount:
                    DashboardBloc.getInstance(context).chatsHistory.length,
                itemBuilder: (context, index) => ChatItem(
                  chatIndex: index,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (state is LoadingMoreChatsHistoryState)
              Center(
                child: CircularLoader(
                  size: 25.s(),
                ),
              )
          ],
        );
      },
    );
  }
}
