//get a animated button that animates over 2 states
//ALso if no toggle button is required state can be null
// a single button can be passed onto the pair
import 'package:flutter/material.dart';
import 'package:trihims_clock/helpers/pair/pair.dart';

Widget getAnimatedButton<bool>({
  required double width,
  required double height,
  required Color color,
  required String toolTip,
  required Pair<bool, void Function()>? state,
  required Pair<IconData, IconData?> iconPairs,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        // Material + InkWell + Ink is being used for the hover effect
        // IF materail is not used then the color of the background container bleeds in
        color: color,
        shape: const CircleBorder(),
        child: InkWell(
          child: Ink(
            width: width,
            height: height,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              shadows: null,
            ),
            child: Center(
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: state == null
                    ? Icon(iconPairs.first)
                    : AnimatedCrossFade(
                        duration: const Duration(milliseconds: 200),
                        firstChild: Icon(iconPairs.first, color: Colors.white),
                        secondChild:
                            Icon(iconPairs.second, color: Colors.white),
                        crossFadeState: state.first == true
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                onPressed: state?.second,
                tooltip: toolTip,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
