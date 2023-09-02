import 'package:flutter/material.dart';

import 'example_drag_and_drop.dart';

final GlobalKey _draggableKey = GlobalKey();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExampleDragAndDrop(),
    );
  }
}
