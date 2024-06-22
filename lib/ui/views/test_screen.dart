import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:chat_gpt_app/core/services/payment/strip/strip_payment_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('appName'.tr()),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{
                await context.setLocale(englishLocale);
              },style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
              ), child: Text('English')),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: ()async{
                await context.setLocale(arabicLocale);
              },style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
              ),  child: Text('Arabic')),
            ],
          ),
          ElevatedButton(onPressed: ()async{
            /*await StripPaymentService.makePayment(amount: 20.0, currency: 'USD');*/
          }, child: Text('Pay 20\$')),
        ],
      ),
    );
  }
}
