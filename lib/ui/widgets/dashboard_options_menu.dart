import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/core/routing/app_routes.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/widgets/new_alert_option_item.dart';
import 'package:chat_gpt_app/ui/widgets/option_item.dart';
import 'package:flutter/material.dart';

class DashboardOptionsMenu extends StatelessWidget {
  const DashboardOptionsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 1.wRatio(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptionItem(
              optionIcon: AppImages.imagesDeleteIcon,
              optionName: AppStrings.clearConversations,
              optionOnTap: (){
                DashboardBloc.getInstance(context).add(ClearConversationsEvent());
              },
            ),
            const SizedBox(
              height: 8,
            ),
            NewAlertOptionItem(onTap: ()async{
              // await StripPaymentService.makePayment(amount: 20.0, currency: 'USD');
            },),
            const SizedBox(
              height: 8,
            ),
            OptionItem(
              optionIcon: AppImages.imagesModeIcon,
              optionName: AppStrings.lightMode,
            ),
            const SizedBox(
              height: 8,
            ),
            OptionItem(
              optionIcon: AppImages.imagesFaqIcon,
              optionName: AppStrings.updatesAndFAQ,
            ),
            const SizedBox(
              height: 8,
            ),
            OptionItem(
              optionIcon: AppImages.imagesLogoutIcon,
              optionName: AppStrings.logout,
              optionColor: Theme.of(context).colorScheme.error,
              optionOnTap: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeScreen, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
