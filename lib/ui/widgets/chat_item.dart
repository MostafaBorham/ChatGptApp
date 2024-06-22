import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/utilities/snackbars.dart';
import 'package:chat_gpt_app/ui/widgets/chat_item_popup_menu_button.dart';
import 'package:chat_gpt_app/ui/widgets/custom_full_wide_thin_divider.dart';
import 'package:chat_gpt_app/ui/widgets/medium_labeled_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key, required this.chatIndex,
  });

  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.conversationScreen,arguments: DashboardBloc.getInstance(context).chatsHistory[chatIndex]);
      },
      child: Column(
        children: [
          Row(
            children: [
              MediumLabeledIcon(label: DashboardBloc.getInstance(context).chatsHistory[chatIndex].title, icon: AppImages.imagesChatLiteIcon,iconW: 15,iconH: 15,),
              Spacer(),
              ChatItemPopupMenuButton(chat: DashboardBloc.getInstance(context).chatsHistory[chatIndex],),
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                context.locale == arabicLocale
                    ? AppImages.imagesBackArrowIcon
                    : AppImages.imagesForwardArrowIcon,
                fit: BoxFit.contain,
                width: 6.75,
                height: 12,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          CustomFullWideThinDivider(),
        ],
      ),
    );
  }
}
