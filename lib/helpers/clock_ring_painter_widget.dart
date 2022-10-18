import 'package:flutter/material.dart';
import 'dart:math';

class ClockRingPainter extends CustomPainter {
  //This class paints the ring over another ring
  static paintClock(Widget? child, double value) {
    return CustomPaint(painter: ClockRingPainter._(value), child: child);
  }

  final double _arcDegree;
  final pi = 3.14;

  ClockRingPainter._(this._arcDegree);
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Get the center of the box
    Offset center = Offset(width / 2, height / 2);
    final maxDimention = max(width, height);
    Rect rect = Rect.fromCenter(
        center: center, width: maxDimention, height: maxDimention);
    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi,
      false,
      paint,
    ); // First draw static arc
    paint.color = Colors.purple;
    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi * _arcDegree,
      false,
      paint,
    ); // Then draw dynamic arc
    // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final oldRingPainter = oldDelegate as ClockRingPainter;
    return oldRingPainter._arcDegree != _arcDegree;
  }
}
