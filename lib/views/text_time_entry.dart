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
    secondsController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 80,
          child: TextField(
            style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
            controller: hoursController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Text(':'),
        SizedBox(
          width: 70,
          height: 80,
          child: TextField(
            controller: minutesController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
