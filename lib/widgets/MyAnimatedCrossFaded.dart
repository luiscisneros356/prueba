import 'package:flutter/material.dart';

class MyAnimatedCrossFaded extends StatefulWidget {
  const MyAnimatedCrossFaded({super.key});

  @override
  State<MyAnimatedCrossFaded> createState() => _MyAnimatedCrossFadedState();
}

class _MyAnimatedCrossFadedState extends State<MyAnimatedCrossFaded> {
  bool showFirst = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            alignment: Alignment.center,
            reverseDuration: const Duration(seconds: 3),
            firstChild: const FlutterLogo(size: 100),
            secondChild: const Icon(Icons.ac_unit, size: 100),
            crossFadeState: showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showFirst = !showFirst;
              });
            },
            child: const Text('Animate'),
          )
        ],
      ),
    );
  }
}
