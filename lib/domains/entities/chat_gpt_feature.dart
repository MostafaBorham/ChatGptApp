import 'package:equatable/equatable.dart';

class ChatGptFeature extends Equatable {
  String icon;
  String title;
  List<String> services;

  ChatGptFeature(
      {required this.icon, required this.title, required this.services});

  @override
  // TODO: implement props
  List<Object?> get props => [
        icon,
        title,
        services,
      ];
}
