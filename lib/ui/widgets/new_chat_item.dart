/*
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatItem extends StatelessWidget {
  const NewChatItem({
    super.key, this.menuBtnWidget, required this.title, required this.icon, this.fontWeight, this.fontSize,
  });
  final Widget? menuBtnWidget;
  final String title;
  final String icon;
  final FontWeight? fontWeight;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: LabeledTitle(labelTitle: title,labelIcon: icon,fontWeight: fontWeight,fontSize: fontSize??s20.s(),)),
            const SizedBox(width: 20,),
            menuBtnWidget??const SizedBox.shrink(),
            SvgPicture.asset('assets/icons/forward_arrow_icon.svg',fit: BoxFit.contain,height: s12.s(),width: s12.s(),),
          ],
        ),
        const SizedBox(height: 10,),
        Divider(
          color: Color(mainForegroundColor).withOpacity(0.4),
          thickness: 1.5,
        )
      ],
    );
  }
}*/
import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/utilities/snackbars.dart';
import 'package:chat_gpt_app/ui/widgets/bold_labeled_icon.dart';
import 'package:chat_gpt_app/ui/widgets/circular_loader.dart';
import 'package:chat_gpt_app/ui/widgets/custom_full_wide_thin_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatItem extends StatelessWidget {
  const NewChatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if(state is FailAddingNewChatState){
          showErrorSnackBar(context: context,message: state.failMessage);
        }
        else if(state is SuccessAddingNewChatState){
          Navigator.pushNamed(context, AppRoutes.conversationScreen,arguments: state.chat);
        }
      },
      builder: (context, state) {
        return state is WaitingAddingNewChatState? const Center(child: CircularLoader()) : GestureDetector(
          onTap: () {
            DashboardBloc.getInstance(context).add(AddNewChatEvent());
          },
          child: Column(
            children: [
              Row(
                children: [
                  BoldLabeledIcon(
                    label: AppStrings.newChat,
                    icon: AppImages.imagesChatIcon,
                    iconH: 15.w(),
                    iconW: 15.w(),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    context.locale == arabicLocale
                        ? AppImages.imagesBackArrowIcon
                        : AppImages.imagesForwardArrowIcon,
                    fit: BoxFit.contain,
                    width: 6.75.w(),
                    height: 12.w(),
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onPrimaryFixed,
                        BlendMode.srcIn),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFullWideThinDivider(),
            ],
          ),
        );
      },
    );
  }
}
