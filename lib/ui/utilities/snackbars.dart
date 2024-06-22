import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';


void showNormalSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message??AppStrings.noMessage),),);
}
void showSuccessSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message??AppStrings.noMessage),backgroundColor: AppColors.green,),);
}

void showErrorSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message??AppStrings.noMessage),backgroundColor: AppColors.red
      ,),);
}