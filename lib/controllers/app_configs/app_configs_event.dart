part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeAppLocaleEvent extends AppConfigsEvent {
  final BuildContext context;

  ChangeAppLocaleEvent(this.context);

  @override
  List<Object?> get props => [
        context,
      ];
}

class LightModeEvent extends AppConfigsEvent {
  LightModeEvent();

  @override
  List<Object?> get props => [
  ];
}

class DarkModeEvent extends AppConfigsEvent {
  DarkModeEvent();

  @override
  List<Object?> get props => [
  ];
}