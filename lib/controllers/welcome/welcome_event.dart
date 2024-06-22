part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent {}

class FeaturesPageViewNavigationEvent extends WelcomeEvent{

  FeaturesPageViewNavigationEvent();

  @override
  List<Object?> get props => [];
}