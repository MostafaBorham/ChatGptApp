import 'package:chat_gpt_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:chat_gpt_app/controllers/conversation/conversation_bloc.dart';
import 'package:chat_gpt_app/controllers/dashboard/dashboard_bloc.dart';
import 'package:chat_gpt_app/controllers/welcome/welcome_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class DependencyInjector {
  static final instance = GetIt.instance;

  static void init() {

    ///Blocs
    ///-> AppConfigsBloc
    instance.registerLazySingleton<AppConfigsBloc>(() => AppConfigsBloc());
    ///-> WelcomeBloc
    instance.registerFactory<WelcomeBloc>(() => WelcomeBloc());
    ///-> ConversationBloc
    instance.registerFactory<ConversationBloc>(() => ConversationBloc());
    ///-> DashboardBloc
    instance.registerFactory<DashboardBloc>(() => DashboardBloc());

    ///Network Connection
    instance.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());
  }
}
