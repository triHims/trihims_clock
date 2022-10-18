import 'package:flutter/material.dart';

class WidgetPositionUtil {
  static RenderBox getRenderBox(GlobalKey key) {
    return key.currentContext?.findRenderObject() as RenderBox;
  }

  static getSize(GlobalKey key) {
    return getRenderBox(key).size;
  }
}
