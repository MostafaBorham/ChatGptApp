import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      AppConfigsBloc.getInstance(context).add(ChangeAppLocaleEvent(context));
    }, style: TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.error,
    ),
        child: AutoSizeText(AppStrings.languageBtnTxt));
  }
}