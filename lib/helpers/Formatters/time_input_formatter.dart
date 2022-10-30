import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/services.dart';

//Class that accepts only numbers
//If isHour is passed then numbers upto 00-99 are accepted
// else numbers only 00-60
//NOTE: This needs improvement
class TimeInputFormatter extends TextInputFormatter {
  final bool isHour;
  TimeInputFormatter({required this.isHour});
  final numberFilterRegex = RegExp(r'[^0-9]');
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = newValue.text;
    print("Old value ${oldValue.text} ${oldValue.selection}");
    print("New value ${newValue.text} ${newValue.selection}");
    if (newString.contains(numberFilterRegex)) {
      print("Contains nonnumber");
      return oldValue;
    }

    int len = newString.length;

    String returnText =
        newString.substring(math.max(0, len - 2)).padLeft(2, "0");

    print("Return text is $returnText");

    if (!isHour) {
      assert(returnText.length == 2);
      int parsedVal = int.parse(returnText);
      if (parsedVal >= 60) {
                return oldValue;
      }
    }

    // return TextEditingValue(
    //     text: returnText, selection: TextSelection.collapsed(offset: -2));
    return newValue.copyWith(text: returnText);
  }
}
