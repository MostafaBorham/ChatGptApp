import 'package:chat_gpt_app/core/errors/errors.dart';

class InvalidPageNumberException implements Exception{
  @override
  String toString() {
    return AppErrors.invalidPageNumberMessage;
  }
}