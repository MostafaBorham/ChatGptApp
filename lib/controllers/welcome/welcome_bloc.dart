import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/domains/entities/chat_gpt_feature.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final PageController pageController=PageController();
  int currentPageIndex=0;
  static final List<ChatGptFeature> features = [
    ChatGptFeature(
        icon: AppImages.imagesExamplesIcon,
        title: AppStrings.examplesKey,
        services: [
          AppStrings.examplesService1Key,
          AppStrings.examplesService2Key,
          AppStrings.examplesService3Key,
        ]),
    ChatGptFeature(
        icon: AppImages.imagesCapabilitiesIcon,
        title: AppStrings.capabilitiesKey,
        services: [
          AppStrings.capabilitiesService1Key,
          AppStrings.capabilitiesService2Key,
          AppStrings.capabilitiesService3Key,
        ]),
    ChatGptFeature(
        icon: AppImages.imagesLimitationsIcon,
        title: AppStrings.limitationsKey,
        services: [
          AppStrings.limitationsService1Key,
          AppStrings.limitationsService2Key,
          AppStrings.limitationsService3Key,
        ]),
  ];
  static WelcomeBloc getInstance(BuildContext context) =>
      BlocProvider.of<WelcomeBloc>(context);

  WelcomeBloc() : super(WelcomeInitial()) {
    on<FeaturesPageViewNavigationEvent>(_navigateFeaturesPageView);
  }

  FutureOr<void> _navigateFeaturesPageView(FeaturesPageViewNavigationEvent event, Emitter<WelcomeState> emit) {
    currentPageIndex++;
    if (currentPageIndex < features.length-1) {
      emit(NextFeaturePageState());
    } else if(currentPageIndex==features.length-1){
      emit(ReadyToLeaveFeaturesPageState());
    }
    else{
      emit(FeaturesPageEndState());
    }
  }
}
