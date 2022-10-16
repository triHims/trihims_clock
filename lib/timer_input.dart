import 'dart:js_util';

import 'package:flutter/material.dart';

class TimerInput {
  static const minMultiplier = 1;
  static const maxMultiplier = 1.8;
  late final TextEditingController _labelInput;
  void showOverlay({required BuildContext context}) {
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _labelInput = TextEditingController();

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * maxMultiplier,
                minWidth: size.width * minMultiplier,
                maxHeight: size.height * maxMultiplier,
                minHeight: size.height * minMultiplier,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Timer",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Icon(Icons.delete),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.label_important_rounded),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 38,
                              child: TextField(
                                controller: _labelInput,
                                decoration: InputDecoration(
                                  hintText: "Label",
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    state?.insert(overlay); // Insert the created overlay
  }
}
