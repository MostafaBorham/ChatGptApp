// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryContainer extends StatelessWidget {
  BlurryContainer({
    super.key,
    required this.child, required this.paddingH, required this.paddingV
  });

  final double paddingH,paddingV;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingH,vertical: paddingV),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: child,
        ),
      ),
    );
  }
}