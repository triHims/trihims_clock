import 'package:flutter/material.dart';

class OverLayTimePicker {
  //Test Widget designed to pick the second hours and minutes
    // Timer Input is real widget this will just only test things 
  // Like material ui
  static const minMultiplier = 1;
  static const maxMultiplier = 1.8;
  late final TextEditingController _labelInput;
  void showOverlay({required BuildContext context}) {
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _labelInput = TextEditingController();
    OverlayEntry? overlay;

    overlay = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            overlay?.remove();
            print("Function is called");
          },
          child: Material(
            color: Colors.black.withAlpha(150),
            child: Center(
              child: GestureDetector(
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
                              "Pick time",
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
                          children: [],
                        )
                      ],
                    ),
                  ),
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
