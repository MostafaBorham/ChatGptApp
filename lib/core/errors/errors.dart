import 'package:chat_gpt_app/core/localization/strings.dart';

abstract class AppErrors{
  static String offlineErrorMessage= AppStrings.offlineError;
  static String serverErrorMessage= AppStrings.serverError;
  static String cacheErrorMessage= AppStrings.cacheError;
  static String invalidPageNumberMessage= AppStrings.invalidPageNumberError;
}