import 'dart:async';

import 'package:chat_gpt_app/ui/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsLoading extends StatefulWidget {
  const CustomDotsLoading({
    super.key,
    required this.dotsCount,
    required this.dotHeight,
    required this.dotWidth,
    required this.dotRadius,
    required this.spacing,
    required this.activeDotColor,
    required this.dotColor,
  });

  final int dotsCount;
  final double dotHeight;
  final double dotWidth;
  final double dotRadius;
  final double spacing;
  final Color activeDotColor;
  final Color dotColor;

  @override
  State<CustomDotsLoading> createState() => _CustomDotsLoadingState();
}

class _CustomDotsLoadingState extends State<CustomDotsLoading> {
  late final Timer timer;
  final loadingDuration = const Duration(milliseconds: 200);
  int currentDotIndex = 0;

  @override
  void initState() {
    startLoadingTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return DotIndicator(
            width: widget.dotWidth,
            height: widget.dotHeight,
            radius: widget.dotRadius,
            color: index == currentDotIndex
                ? widget.activeDotColor
                : widget.dotColor,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: widget.spacing,
          );
        },
        itemCount: widget.dotsCount);
  }

  void startLoadingTimer() {
    timer = Timer.periodic(loadingDuration, (_) {
      currentDotIndex = (++currentDotIndex) % widget.dotsCount;
      setState(() {});
    });
  }
}
