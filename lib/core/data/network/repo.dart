import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_app/core/connection/connection_checker.dart';
import 'package:chat_gpt_app/core/data/local/data_sources/cache_helper.dart';
import 'package:chat_gpt_app/core/data/network/data_sources/dio_helper.dart';
import 'package:chat_gpt_app/core/data/network/data_sources/firebase_helper.dart';
import 'package:chat_gpt_app/core/data/network/endpoints.dart';
import 'package:chat_gpt_app/core/data/network/network_constants.dart';
import 'package:chat_gpt_app/core/errors/failures.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:chat_gpt_app/domains/mappers/chat_mapper.dart';
import 'package:chat_gpt_app/domains/models/chat_model.dart';
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class NetworkRepo {
  static Future<Either<Failure, String>> askChatGpt(
      {required String question}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final chatGpt = ChatGpt(apiKey: apiKey);

        final request = ChatCompletionRequest(
            model: chatGptModel,
            messages: [Message(role: question, content: question)],);

        final result = await chatGpt.createChatCompletion(request);
        return Right(result!.choices!.first.finishReason!);
/*        final response = await DioHelper.postData(
          body: {
            'prompt': question,
            'model': chatGptModel,
            "max_tokens": maxToken,
            "temperature": temperature,
            "top_p": topP,
          },
          endPoint: askQuestionEndpoint,
        );
        print('MyStatusCode=${response.statusCode}');
        print('MyStatusMessage=${response.statusMessage}');
        if (response.statusCode == successStatusCode) {
          var answer = jsonDecode(response.data)['choices'][0]['text'];
          return Right(answer);
        } else {
          return Left(Failure(message: response.statusMessage));
        }*/
      } on DioException catch (ex, _) {
        print('Error Here');
        return Left(Failure(message: ex.response!.data['error']['type']));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, List<Chat>>> getChatsHistory(
      {int page = 1}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final chatsDocs = await FirebaseHelper.fetchAllDocsData(
          collection: chatsCollection,
          page: page,
          pageSize: chatsHistoryPageSize,
          descendingOrder: true,
          fieldOrder: 'createdAt',
        );
        final chatsList = chatsDocs.map<Chat>(
          (chatDoc) {
            return ChatModel.fromJson(chatDoc.data()).toEntity();
          },
        ).toList();
        return Right(chatsList);
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, Chat>> addNewChat({
    required ChatModel chat,
  }) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final newChatId = await FirebaseHelper.addDataToCollection(
            collection: chatsCollection, data: chat.toJson());
        await FirebaseHelper.updateData(
            collection: chatsCollection,
            data: chat.copyWith(newId: newChatId).toModel().toJson(),
            docId: newChatId);
        return Right(chat.copyWith(newId: newChatId));
      } on FirebaseException catch (e, _) {
        return Left(Failure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> saveChat({
    required ChatModel chat,
  }) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final newChatId = await FirebaseHelper.updateData(
          collection: chatsCollection,
          data: chat.toJson(),
          docId: chat.id,
        );
        return Right(newChatId);
      } on FirebaseException catch (e, _) {
        return Left(Failure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> clearConversations() async {
    if (await ConnectionChecker.isConnected) {
      try {
        await FirebaseHelper.deleteAllCollectionDocs(
          collection: chatsCollection,
        );
        return const Right(null);
      } on FirebaseException catch (e, _) {
        return Left(Failure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> deleteSingleChat(
      {required String chatId}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        await FirebaseHelper.deleteSingleCollectionDoc(
            collection: chatsCollection, docId: chatId);
        return const Right(null);
      } on FirebaseException catch (e, _) {
        return Left(Failure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
