# AsyncButton Example

This is a basic example of how to use the AsyncButton widget from the `async_progress_button` package in your Flutter application.

## Import the package

First, you need to import the `async_progress_button` package in your Dart file:

(```dart
import 'package:async_progress_button/async_progress_button.dart'; 
)

## Use the AsyncButton widget
Here’s a simple example of using the AsyncButton widget:

(```dart
AsyncButton(
  text: 'Click Me',
  onPressed: () async {
    // Your async operation here
  },
)
)


You can customize the AsyncButton widget by specifying different parameters, such as color, icon, iconColor, iconSize, width, and height.

## Full Example
Here’s a full example of a Flutter 

```dart
import 'package:flutter/material.dart';
import 'package:async_progress_button/async_progress_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AsyncButton Example'),
        ),
        body: Center(
          child: AsyncButton(
            text: 'Click Me',
            onPressed: () async {
              // Your async operation here
            },
          ),
        ),
      ),
    );
  }
}

