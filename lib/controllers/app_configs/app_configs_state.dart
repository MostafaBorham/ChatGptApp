part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AppConfigsInitial extends AppConfigsState {}


class EnglishLocaleState extends AppConfigsState{
  @override
  List<Object?> get props => [];
}

class ArabicLocaleState extends AppConfigsState{
  @override
  List<Object?> get props => [];
}

class LightModeState extends AppConfigsState{
  @override
  List<Object?> get props => [];
}

class DarkModeState extends AppConfigsState{
  @override
  List<Object?> get props => [];
}