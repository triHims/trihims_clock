import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextTimeEntry extends StatefulWidget {
  const TextTimeEntry({Key? key}) : super(key: key);

  @override
  State<TextTimeEntry> createState() => _TextTimeEntryState();
}

class _TextTimeEntryState extends State<TextTimeEntry> {
  late final TextEditingController hoursController;
  late final TextEditingController minutesController;
  late final TextEditingController secondsController;

  @override
  void initState() {
    hoursController = TextEditingController(text: '7');
    minutesController = TextEditingController(text: '15');
    secondsController = TextEditingController(text: '20');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.move_up),
              onPressed: null,
              tooltip: 'increment',
            ),
            SizedBox(
              width: 70,
              height: 80,
              child: TextField(
                controller: hoursController,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            child: Text(
              ':',
              style: TextStyle(
                  height: 2, fontSize: 30, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 70,
          height: 80,
          child: TextField(
            controller: minutesController,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            child: Text(
              ':',
              style: TextStyle(
                  height: 2, fontSize: 30, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 70,
          height: 80,
          child: TextField(
            controller: secondsController,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
