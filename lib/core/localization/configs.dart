import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationInit extends StatelessWidget {
  const LocalizationInit({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: supportedLocales,
        path: translationsPath, // <-- change the path of the translation files
        fallbackLocale: englishLocale,
        saveLocale: true,
        useOnlyLangCode: false,
        child: child);
  }
}
