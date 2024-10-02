import 'package:flutter/material.dart';

class MyIndexStack extends StatefulWidget {
  const MyIndexStack({super.key});

  @override
  State<MyIndexStack> createState() => _MyIndexStackState();
}

class _MyIndexStackState extends State<MyIndexStack> {
  int indexOut = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          ...List.generate(
            3,
            (index) => ElevatedButton(
              onPressed: () {
                setState(() {
                  indexOut = index;
                });
              },
              child: Text("$index"),
            ),
          ),
        ],
      ),
      IndexedStack(
        index: indexOut,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.green,
          ),
        ],
      ),
    ]);
  }
}
