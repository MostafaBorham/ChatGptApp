import 'dart:async';

import 'package:chat_gpt_app/core/data/local/data_sources/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/constants.dart';

part 'app_configs_event.dart';
part 'app_configs_state.dart';

class AppConfigsBloc extends Bloc<AppConfigsEvent, AppConfigsState> {
  static late ThemeMode appMode;

  static AppConfigsBloc getInstance(BuildContext context) =>
      BlocProvider.of<AppConfigsBloc>(context);

  AppConfigsBloc() : super(AppConfigsInitial()) {
    on<ChangeAppLocaleEvent>(_changeAppLocale);
    on<LightModeEvent>(_setLightMode);
    on<DarkModeEvent>(_setDarkMode);
  }

  Future<FutureOr<void>> _changeAppLocale(
      ChangeAppLocaleEvent event, Emitter<AppConfigsState> emit) async {
    if (event.context.locale == englishLocale) {
      await event.context.setLocale(arabicLocale);
      emit(ArabicLocaleState());
    } else if (event.context.locale == arabicLocale) {
      await event.context.setLocale(englishLocale);
      emit(EnglishLocaleState());
    }
  }

  Future<FutureOr<void>> _setLightMode(
      LightModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.light;
    await CacheHelper.saveAppMode(mode: appMode).then((value) {
      emit(LightModeState());
    });
  }

  Future<FutureOr<void>> _setDarkMode(
      DarkModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.dark;
    await CacheHelper.saveAppMode(mode: appMode);
    emit(DarkModeState());
  }
}
