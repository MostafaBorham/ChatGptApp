import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/widgets/labeled_alert.dart';
import 'package:chat_gpt_app/ui/widgets/option_item.dart';
import 'package:flutter/material.dart';

class NewAlertOptionItem extends StatelessWidget {
  const NewAlertOptionItem({
    super.key, this.onTap,
  });
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OptionItem(optionName: AppStrings.upgradeToPlus, optionIcon: AppImages.imagesUpgradeIcon,optionOnTap: onTap,),
        LabeledAlert(label: AppStrings.newTxt,),
      ],
    );
  }
}