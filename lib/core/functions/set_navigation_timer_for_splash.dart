import 'dart:async';
import 'package:flutter/material.dart';

void setNavigationTimerForSplash(BuildContext context,int durationInMilli,String route) {
  Timer(
      Duration(milliseconds: durationInMilli),
          () =>
          Navigator.of(context).pushReplacementNamed(route));
}