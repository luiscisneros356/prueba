// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/mobile_screen_2.dart';

Future<void> main() async {
  // final luis = Luis();

  // await Future.delayed(const Duration(seconds: 2));

  // print('Luis is adult: ${luis.luisIsAdult}');

  // await Future.delayed(const Duration(seconds: 2));

  // print('Inicio del programa');
  // // Timer.periodic(const Duration(seconds: 1), (timer) {
  // //   print(timer.tick);
  // // });

  // scheduleMicrotask(() {
  //   print('Esta es una microtarea');
  // });

  // Future.microtask(() {
  //   print('Esta es una microtarea futura 2');
  // });

  // print('Fin del programa');

  // runZonedGuarded(() {
  //   final result = 1 ~/ 0;

  //   print(result);
  // }, (Object error, StackTrace stackTrace) {
  //   // Custom error handling logic
  //   print('Error: $error');
  //   print('Stack Trace: $stackTrace');
  // });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(80.0),
        //     child: Container(
        //       height: 120,
        //       decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [Colors.blue, Colors.green],
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //         ),
        //       ),
        //       child: const SafeArea(
        //         child: ListTile(
        //           title: Text('App Bar', style: TextStyle(fontSize: 30, color: Colors.white)),
        //           subtitle: Text('This is a custom app bar', style: TextStyle(fontSize: 20, color: Colors.white)),
        //         ),
        //       ),
        //     )),

        body: MobileScreen2(),
        // body: MyOrentationBUilder(),
      ),
    );
  }
}
