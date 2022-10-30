import 'package:flutter/material.dart';

import 'package:trihims_clock/views/timer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const HomePage(),
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(1,85, 40, 111,))
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer"),
          centerTitle: false,
        ),
        body: const Timer());
  }
}

//Widget abondoned
class Mycircle extends StatelessWidget {
  const Mycircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = Tween<double>(begin: 0, end: 1);
    return Center(
      child: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(width: 4, color: Colors.red)),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.purple,
                shape: CircleBorder(),
              ),
              child: const IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: null,
                tooltip: "Start",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2.0,
              color: Colors.red,
            )),
            width: 400,
            height: 400,
            child: TweenAnimationBuilder<double>(
              tween: tween,
              duration: const Duration(seconds: 20),
              builder: (context, value, child) {
                return CustomPaint(
                  painter: RingPainter(value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//abondoned
class RingPainter extends CustomPainter {
  final double _arcDegree;
  final pi = 3.14;

  RingPainter(this._arcDegree);
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 16.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Get the center of the box
    Offset center = Offset(width / 2, height / 2);
    Rect rect = Rect.fromCenter(center: center, width: width, height: height);
    // canvas.drawCircle(center, radius, paint);
    print("argDegre is $_arcDegree");
    canvas.drawArc(rect, -pi / 2, 2 * pi * _arcDegree, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final oldRingPainter = oldDelegate as RingPainter;
    return oldRingPainter._arcDegree != _arcDegree;
  }
}
// class Mycircle extends StatelessWidget {
//   const Mycircle({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//             border: Border.all(
//           width: 2.0,
//           color: Colors.red,
//         )),
//         width: 400,
//         height: 400,
//         child: CustomPaint(
//           painter: RingPainter(),
//         ),
//       ),
//     );
//   }
// }
//
// class RingPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double width = size.width;
//     double height = size.height;
//     print("Canvas Width is : $width and Height is $height");
//     Paint paint = Paint()
//       ..color = Colors.green
//       ..strokeWidth = 16.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     // Get the center of the box
//     Offset center = Offset(width / 2, height / 2);
//     double radius = min(width / 4, height / 4);
//     canvas.drawCircle(center, radius, paint);
//     
//     // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
