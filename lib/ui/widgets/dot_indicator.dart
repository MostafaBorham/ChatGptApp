import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
  });

  final double width;
  final double height;
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
      ),
    );
  }
}