import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trihims_clock/helpers/Formatters/time_input_formatter.dart';

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
    hoursController = TextEditingController(text: '07');
    minutesController = TextEditingController(text: '15');
    secondsController = TextEditingController(text: '20');
    super.initState();
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TImeEntry
        getTimeInputBox(hoursController, true), //Hours time Input
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            ':',
            style:
                TextStyle(height: 2, fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        getTimeInputBox(minutesController, false), //Minutes time input
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            ':',
            style:
                TextStyle(height: 2, fontSize: 30, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        getTimeInputBox(secondsController, false), //Seconds time input
      ],
    );
  }
}

myListner(TextEditingController textController) {
  final currentValue = textController.value.text;
  int.parse(currentValue);
}

Widget getTimeInputBox(TextEditingController textController, bool isHour) {
  int MOD = isHour ? 100 : 61;
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        constraints: BoxConstraints(maxHeight: 24),
        padding: EdgeInsets.all(0),
        icon: Icon(FontAwesomeIcons.caretUp),
        onPressed: () {
          int number = int.parse(textController.text);
          number = number + 1;

          number %= MOD;
          textController.text = number.toString().padLeft(2, '0');
        },
        tooltip: 'increment',
      ),
      SizedBox(
        width: 70,
        child: TextField(
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          controller: textController,
          inputFormatters: [
            TimeInputFormatter(isHour: isHour),
          ],
        ),
      ),
      IconButton(
        constraints: BoxConstraints(maxHeight: 24),
        padding: EdgeInsets.all(0),
        icon: Icon(FontAwesomeIcons.caretDown),
        tooltip: 'decrement',
        onPressed: () {
          int number = int.parse(textController.text);
          number = number - 1;

          number %= MOD;
          textController.text = number.toString().padLeft(2, '0');
        },
      ),
    ],
  );
}
