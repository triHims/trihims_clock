import 'package:flutter/material.dart';

import 'package:trihims_clock/clock_ring_painter_widget.dart';
import 'package:trihims_clock/helpers/pair/pair.dart';
import 'package:trihims_clock/timer_input.dart';
import 'package:trihims_clock/timer_picker.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  double endTime = 0;
  int startTime = 0;
  bool timerActive = false;
  Size? clockSize;

  togglePlayState() {
    setState(() {
      timerActive = !timerActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          width: 190,
          height: 190,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: endTime),
            duration: const Duration(seconds: 20),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "00:00:00", // style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 50),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            builder: (context, value, child) {
              return ClockRingPainter.paintClock(child, value);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            getAnimatedButton(
                width: 30,
                height: 30,
                toolTip: "Start/Pause",
                color: Colors.blue,
                state: Pair(timerActive, togglePlayState),
                iconPairs: Pair(Icons.pause, Icons.play_arrow)),
            getAnimatedButton(
                width: 30,
                height: 30,
                toolTip: "Restart",
                color: Colors.grey[500]!,
                state: Pair(true, () {
                  print("Hallo");
                  TimerPicker().showOverlay(context: context);
                }),
                iconPairs: Pair(Icons.replay, null)),
            getAnimatedButton(
                width: 30,
                height: 30,
                toolTip: "SHow demo toolbaar",
                color: Colors.grey[500]!,
                state: Pair(true, () {
                  print("Hallo");
                  final newTime = showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 7, minute: 15),
                    initialEntryMode: TimePickerEntryMode.input,
                  );
                }),
                iconPairs: Pair(Icons.replay, null))
          ],
        )
      ],
    );
  }
}

class WidgetPosition {
  static RenderBox getRenderBox(GlobalKey key) {
    return key.currentContext?.findRenderObject() as RenderBox;
  }

  static getSize(GlobalKey key) {
    return getRenderBox(key).size;
  }
}

//get a animated button that animates over 2 states
//ALso if no toggle button is required state can be null
// a single button can be passed onto the pair
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
