import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/utilities/snackbars.dart';
import 'package:chat_gpt_app/ui/widgets/delete_item.dart';
import 'package:chat_gpt_app/ui/widgets/edit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatItemPopupMenuButton extends StatefulWidget {
  const ChatItemPopupMenuButton({
    super.key,required this.chat,
  });
  final Chat chat;
  @override
  State<ChatItemPopupMenuButton> createState() =>
      _ChatItemPopupMenuButtonState();
}

class _ChatItemPopupMenuButtonState extends State<ChatItemPopupMenuButton> {
  final int _editValue = 0;
  final int _deleteValue = 1;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: _onSelected,
      itemBuilder: _itemBuilder,
      child: SvgPicture.asset(
        AppImages.imagesMenuOptionsIcon,
        fit: BoxFit.contain,
        height: 12,
        width: 2.67,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
      ),
      color: Theme.of(context).colorScheme.onPrimary,
      clipBehavior: Clip.hardEdge,
      position: PopupMenuPosition.under,
    );
  }

  void _onSelected(int item) {
    if (item == _editValue) {
      Navigator.pushNamed(context, AppRoutes.conversationScreen,arguments: widget.chat);
    } else if (item == _deleteValue) {
      ///clear this chat from api and from list and setState
      DashboardBloc.getInstance(context).add(DeleteSingleChatEvent(chatId: widget.chat.id));
    } else {
      showNormalSnackBar(context: context, message: 'None');
    }
  }

  List<PopupMenuEntry<int>> _itemBuilder(BuildContext context) => [
        editPopupMenuItem(),
        deletePopupMenuItem(),
      ];

  PopupMenuItem<int> deletePopupMenuItem() {
    return PopupMenuItem(
      value: _deleteValue,
      child: SizedBox(
        width: 90,
        child: DeleteItem(),
      ),
    );
  }

  PopupMenuItem<int> editPopupMenuItem() {
    return PopupMenuItem(
      value: _editValue,
      child: SizedBox(
        width: 90,
        child: EditItem(),
      ),
    );
  }
}
