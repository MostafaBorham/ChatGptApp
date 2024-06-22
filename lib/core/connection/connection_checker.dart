import 'package:chat_gpt_app/core/services/di.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  static Future<bool> get isConnected =>
      DependencyInjector.instance<InternetConnectionChecker>().hasConnection;
}