import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/domains/mappers/chat_mapper.dart';

class ChatModel extends Chat {
  ChatModel({
    required super.id,
    required super.title,
    required super.chats,
    required super.createdAt,
  });

  factory ChatModel.fromJson(Map json) => ChatModel(
        id: json['id'],
        title: json['title'],
        createdAt: json['createdAt'],
        chats: json['chats']
            .map<ChatQuestionAndAnswer>(
              (chat) {
                final model=ChatQuestionAndAnswerModel.fromJson(chat);
                return model.toEntity();
              },
            )
            .toList(),
      );

  Map<String,dynamic> toJson()=>{
    'id' : id,
    'createdAt' : createdAt,
    'title' : title,
    'chats' : chats.map<Map>((chat) {
      return chat.toModel().toJson();
    },).toList(),
  };
}

class ChatQuestionAndAnswerModel extends ChatQuestionAndAnswer {
  ChatQuestionAndAnswerModel({
    required super.id,
    required super.question,
    required super.answer,
    required super.isLiked,
    required super.isAnswered,
  });

  factory ChatQuestionAndAnswerModel.fromJson(Map json) =>
      ChatQuestionAndAnswerModel(
        id: json['id'],
        question: json['question'],
        answer: json['answer'],
        isLiked: json['isLiked'],
        isAnswered: json['isAnswered'],
      );

  Map toJson()=>{
    'id' : id,
    'question' : question,
    'answer' : answer,
    'isLiked' : isLiked,
    'isAnswered' : isAnswered,
  };
}
