import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  String id;
  String title;
  Timestamp? createdAt;
  List<ChatQuestionAndAnswer> chats;

  Chat(
      {required this.id,
      required this.title,
      required this.chats,
      this.createdAt});

  Chat copyWith(
          {String? newId,
          String? newTitle,
          Timestamp? newCreatedAt,
          List<ChatQuestionAndAnswer>? newChats}) =>
      Chat(
        id: newId ?? id,
        title: newTitle ?? title,
        chats: newChats ?? chats,
        createdAt: newCreatedAt ?? createdAt,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        chats,
        createdAt,
      ];
}

class ChatQuestionAndAnswer extends Equatable {
  String id;
  String question;
  String? answer;
  bool isLiked;
  bool isAnswered;

  ChatQuestionAndAnswer(
      {required this.id,
      required this.question,
      this.answer,
      required this.isLiked,
      required this.isAnswered});

  ChatQuestionAndAnswer copyWith(
          {String? newId,
          String? newQuestion,
          String? newAnswer,
          bool? newIsLiked,
          bool? newIsAnswered}) =>
      ChatQuestionAndAnswer(
        id: newId ?? id,
        answer: newAnswer ?? answer,
        question: newQuestion ?? question,
        isAnswered: newIsAnswered ?? isAnswered,
        isLiked: newIsLiked ?? isLiked,
      );

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
        isLiked,
        isAnswered,
      ];
}
