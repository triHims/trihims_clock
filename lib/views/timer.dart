import 'package:flutter/material.dart';
import 'package:trihims_clock/comps/animated_button.dart';
import 'package:trihims_clock/helpers/clock_ring_painter_widget.dart';
import 'package:trihims_clock/helpers/pair/pair.dart';
import 'package:trihims_clock/views/timer_input.dart';

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

// Must maintain the circle and other timer , for a particular timer card
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
    super.initState();
  }

  String timerDuration = "00:00:00";

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
                  timerDuration, // style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 50),
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
                color: Theme.of(context).colorScheme.primary,
                state: Pair(timerActive, togglePlayState),
                iconPairs: Pair(Icons.pause, Icons.play_arrow)),
            getAnimatedButton(
                width: 30,
                height: 30,
                toolTip: "Restart",
                color: Theme.of(context).colorScheme.secondary,
                state: Pair(true, () {
                  print("Hallo");
                  // TimerPicker().showOverlay(context: context);
                  TimerInput().showOverlay(
                    context: context,
                    callBack: (input) {
                      setState(() {
                        timerDuration = input;
                      });
                    },
                    initialTime: timerDuration,
                  );
                }),
                iconPairs: Pair(Icons.replay, null)),
            getAnimatedButton(
                width: 30,
                height: 30,
                toolTip: "SHow demo toolbaar",
                color: Theme.of(context).colorScheme.secondary,
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
