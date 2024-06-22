part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class NextFeaturePageState extends WelcomeState {

  NextFeaturePageState();

  @override
  List<Object?> get props => [];
}

class ReadyToLeaveFeaturesPageState extends WelcomeState {

  ReadyToLeaveFeaturesPageState();
  @override
  List<Object?> get props => [];
}

class FeaturesPageEndState extends WelcomeState {

  FeaturesPageEndState();
  @override
  List<Object?> get props => [];
}