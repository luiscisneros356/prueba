import 'package:flutter/material.dart';

class MyAnimatedRotation extends StatefulWidget {
  const MyAnimatedRotation({super.key});

  @override
  State<MyAnimatedRotation> createState() => _MyAnimatedRotationState();
}

class _MyAnimatedRotationState extends State<MyAnimatedRotation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        child: TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            onEnd: () => showDialog(
                context: context, builder: (context) => const AlertDialog(content: Text('End of animation'))),
            tween: Tween<double>(begin: 0, end: 2 * 3.1416),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform.rotate(
                angle: value,
                child: child,
              );
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Click me!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }
}

class MyRotation extends StatefulWidget {
  const MyRotation({super.key});

  @override
  State<MyRotation> createState() => _MyRotationState();
}

class _MyRotationState extends State<MyRotation> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(seconds: 2),
      child: InkWell(
          onTap: () {
            setState(() {
              turns = turns == 0.0 ? 0.25 : 0.0;
            });
          },
          child: const FlutterLogo(size: 200)),
    );
  }
}
