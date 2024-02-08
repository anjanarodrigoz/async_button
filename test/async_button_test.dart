import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_progress_button/async_progress_button.dart';

void main() {
  testWidgets('AsyncButton responds to tap', (WidgetTester tester) async {
    bool wasPressed = false;

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AsyncButton(
            text: 'Click Me',
            onPressed: () async {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    // Create the Finders.
    final buttonFinder = find.text('Click Me');

    // Use the `expects` function to verify that the button is on screen.
    expect(buttonFinder, findsOneWidget);

    // Tap on the button and trigger a frame.
    await tester.tap(buttonFinder);
    await tester.pump();

    // Verify that the callback is called when the button is tapped.
    expect(wasPressed, true);
  });
}
