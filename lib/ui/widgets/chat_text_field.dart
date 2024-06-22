import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_send_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.chatInputFieldController, this.onTap,
  });

  final TextEditingController chatInputFieldController;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      clipBehavior: Clip.hardEdge,
      controller: chatInputFieldController,
      maxLines: 1,
      style: AppStyles.getSemiBoldStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      cursorColor: Theme.of(context).colorScheme.onBackground,
      cursorHeight: 28,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: ChatSendIcon(),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        enabledBorder: _buildOutlineInputBorder(Theme.of(context).colorScheme.shadow),
        focusedBorder: _buildOutlineInputBorder(Theme.of(context).colorScheme.shadow),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: borderColor,
          width:1,
        )
    );
  }
}