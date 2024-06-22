import 'package:chat_gpt_app/core/data/local/data_sources/cache_helper.dart';
import 'package:chat_gpt_app/core/data/network/network_constants.dart';
import 'package:dio/dio.dart';

abstract class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      contentType: contentType,
      connectTimeout: const Duration(seconds: 15),
      headers: {
        'Authorization': 'Bearer $apiKey',
      }
    ));
  }

  static Future<Response> getData(
      {String? endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? params}) async {
    return await dio!.get(
      endPoint!,
      data: body,
      queryParameters: params,
    );
  }

  static Future<Response> postData(
      {String? endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? params}) async {
    return await dio!.post(endPoint!, data: body, queryParameters: params);
  }
}
