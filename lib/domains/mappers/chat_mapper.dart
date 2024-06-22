import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/domains/models/chat_model.dart';

extension ChatModelExt on ChatModel {
  Chat toEntity() => Chat(
    id: id,
    title: title,
    chats: chats,
    createdAt: createdAt,
  );
}

extension ChatExt on Chat {
  ChatModel toModel() => ChatModel(
    id: id,
    title: title,
    chats: chats,
    createdAt: createdAt,
  );
}


extension ChatQuestionAndAnswerModelExt on ChatQuestionAndAnswerModel {
  ChatQuestionAndAnswer toEntity() => ChatQuestionAndAnswer(
        id: id,
        question: question,
        answer: answer,
        isLiked: isLiked,
        isAnswered: isAnswered,
      );
}

extension ChatQuestionAndAnswerExt on ChatQuestionAndAnswer {
  ChatQuestionAndAnswerModel toModel() => ChatQuestionAndAnswerModel(
    id: id,
    question: question,
    answer: answer,
    isLiked: isLiked,
    isAnswered: isAnswered,
  );
}