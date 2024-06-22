import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size??15.s(),
        width: size??15.s(),
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.outline,
          strokeWidth: 2.s(),
        ),
      ),
    );
  }
}
