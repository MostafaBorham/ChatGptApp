/*import 'package:chat_gpt_app/core/data/network/data_sources/dio_helper.dart';
import 'package:chat_gpt_app/core/services/payment/strip/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class StripPaymentService{
  static Future<void> makePayment({required double amount,required String currency})async{
    try {
      String clientSecret=await _getClientSecret(amount: amount.toString(),currency: currency);
      await _initializePaymentSheet(clientSecret);
      Stripe.instance.presentPaymentSheet();
    }
    catch(error){
      throw Exception(error.toString());
    }
  }

  static Future<String> _getClientSecret({required String amount,required String currency}) async{
    var response= await DioHelper.dio!.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${StripConstants.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );

    return response.data['client_secret'];
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "ChatGptApp",
      ),
    );
  }
}*/
