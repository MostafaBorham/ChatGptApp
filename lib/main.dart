import 'package:chat_gpt_app/app_init.dart';
import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/core/data/local/data_sources/cache_helper.dart';
import 'package:chat_gpt_app/core/data/network/data_sources/dio_helper.dart';
import 'package:chat_gpt_app/core/localization/configs.dart';
import 'package:chat_gpt_app/core/services/di.dart';
import 'package:chat_gpt_app/core/services/payment/strip/constants.dart';
import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_gpt_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey=StripConstants.publishableKey;/// initialize Strip Payment
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DependencyInjector.init();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  AppConfigsBloc.appMode = CacheHelper.getAppMode();

  ///init App Mode
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(DevicePreview(
      enabled: true,
      builder: (_)=>const LocalizationInit(child: ChatGptApp()))));
}
