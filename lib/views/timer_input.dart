import 'package:flutter/material.dart';
import 'package:trihims_clock/views/text_time_entry.dart';

class TimerInput {
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
        final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            onSurface: Theme.of(context).colorScheme.primary);
        final ButtonStyle cancelElevatedButtonStyle = ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            onPrimary: Theme.of(context).colorScheme.onSurface);

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            overlay?.remove();
            print("Function is called");
          },
          child: Material(
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
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                                      enabledBorder:
                                          const UnderlineInputBorder()),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextTimeEntry(),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black.withAlpha(50),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.save),
                                label: const Text("Save"),
                                style: elevatedButtonStyle,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.cancel_sharp),
                                label: const Text('Cancel'),
                                style: cancelElevatedButtonStyle,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
