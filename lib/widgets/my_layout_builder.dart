import 'package:flutter/material.dart';
import 'package:flutter_pruebas/widgets/gridTitle.dart';

import 'animated_rotation.dart';

class MyLayoutBuilder extends StatefulWidget {
  const MyLayoutBuilder({super.key});

  @override
  State<MyLayoutBuilder> createState() => _MyLayoutBuilderState();
}

class _MyLayoutBuilderState extends State<MyLayoutBuilder> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    print('LayoutBuilder');
    _counter++;
    print('Counter: $_counter');
    return LayoutBuilder(
      builder: (context, constraints) {
        print("constraints.maxWidth: ${constraints.maxWidth}");

        if (constraints.maxWidth < 300) {
          return const MyGridTitle();
        } else {
          return const MyAnimatedRotation();
        }
      },
    );
  }
}

class MyOrentationBUilder extends StatefulWidget {
  const MyOrentationBUilder({super.key});

  @override
  State<MyOrentationBUilder> createState() => _MyOrentationBUilderState();
}

class _MyOrentationBUilderState extends State<MyOrentationBUilder> {
  @override
  void dispose() {
    print("DISPOSE");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Center(
      child: OrientationBuilder(builder: (context, orientation) {
        print('OrientationBuilder');
        print('Orientation: $orientation');
        if (orientation == Orientation.portrait) {
          return const Text('Portrait');
        } else {
          return const Text("Landscape");
        }
      }),
    );
  }
}
