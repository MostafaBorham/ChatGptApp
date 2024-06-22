import 'dart:ui';

import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/widgets/circular_loader.dart';
import 'package:flutter/material.dart';

class BlurryCircularLoader extends StatelessWidget {
  const BlurryCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.grey_343541,
            borderRadius: BorderRadius.circular(0),
          ),
          child: const CircularLoader(),
        ),
      ),
    );
  }
}
