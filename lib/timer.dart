import 'package:flutter/material.dart';
import 'dart:math';

import 'package:trihims_clock/clock_ring_painter_widget.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minWidth: 300,
          minHeight: 300,
          maxWidth: 300,
          maxHeight: 300,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200], //NOTE: THemeify it
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1), //NOTE: THemeify it
              spreadRadius: 0.1,
              blurRadius: 0.3,
            )
          ],
        ),
        child: const ClockDecor(),
      ),
    );
  }
}

class ClockDecor extends StatefulWidget {
  const ClockDecor({Key? key}) : super(key: key);

  @override
  State<ClockDecor> createState() => _ClockDecorState();
}

class _ClockDecorState extends State<ClockDecor> {
  double endTime = 0;
  double startTime = 0;
    Size? clockSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: endTime),
            duration: const Duration(seconds: 20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "00:00:00", // style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 50),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            builder: (context, value, child) {
              return ClockRingPainter.paintClock(child, value);
            },
          ),
        ),
      ],
    );
  }
}
