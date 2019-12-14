import 'dart:math';

import 'package:flutter/material.dart';
import 'package:giftmoney/theme/theme.dart';

class CircleProgress extends CustomPainter {
  double completePercent;
  CircleProgress({this.completePercent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = AppColor.grayBackground
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    Paint complete = Paint()
      ..color = AppColor.mainAppColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
