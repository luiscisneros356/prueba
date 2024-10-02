import 'dart:async';

import 'package:flutter/material.dart';

class MyAnimationContainer extends StatefulWidget {
  const MyAnimationContainer({super.key});

  @override
  State<MyAnimationContainer> createState() => _MyAnimationContainerState();
}

class _MyAnimationContainerState extends State<MyAnimationContainer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);

    // if (_controller.isCompleted) {
    //   _controller.reverse();
    // } else {
    //   _controller.forward();
    // }
    _controller.repeat(reverse: true);
    // _controller.addListener(() {
    //   if (_controller.isCompleted) {
    //     _controller.reverse();
    //   } else {
    //     _controller.forward();
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      body: Column(
        children: [
          const Text('Animation Container', style: TextStyle(fontSize: 30)),
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                print('Rebuild');

                final luis = Luis();

                return Center(
                  child: Container(
                    width: _animation.value,
                    height: _animation.value,
                    color: Colors.blue,
                    child: Text('Luis is adult: ${luis.luisIsAdult}', style: const TextStyle(fontSize: 20)),
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(_controller.status);
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      }),
    );
  }
}

FutureOr<void> myFunction() {
  print('My function');
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  Future<bool> isAdult() async => Future.value(age >= 18);
}

class Luis {
  final Person person = Person(name: 'Luis', age: 34);

  Luis();

  bool get luisIsAdult {
    person.isAdult().then((value) {
      print('Is adult: $value');
      return value;
    });

    return false;
  }
}
