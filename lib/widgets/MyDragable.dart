import 'package:flutter/material.dart';

class MyDragagle extends StatefulWidget {
  const MyDragagle({super.key});

  @override
  State<MyDragagle> createState() => _MyDragagleState();
}

class _MyDragagleState extends State<MyDragagle> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Draggable(
          feedback: const Center(
            child: Icon(
              Icons.ac_unit,
              size: 50,
              color: Colors.red,
            ),
          ),
          childWhenDragging: Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
          ),
          onDragEnd: (details) {
            print(details.offset);
            print('Drag ended');
          },
          onDragStarted: () {
            print('Drag started');
          },
          onDraggableCanceled: (velocity, offset) {
            print('Draggable canceled');
          },
          onDragCompleted: () {
            showDialog(context: context, builder: (context) => const AlertDialog(title: Text('Draggable completed')));
            print('Draggable completed');
          },
          data: 'Hello',
          dragAnchorStrategy: childDragAnchorStrategy,
          ignoringFeedbackSemantics: true,
          maxSimultaneousDrags: 1,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
        ),
        DragTarget(
            builder: (builder, _, __) {
              return Container(
                height: 200,
                width: 200,
                color: color,
              );
            },
            onLeave: (data) => print('Drag target left'),
            onWillAccept: (data) {
              print('Drag target will accept');
              return true;
            },
            onAccept: (data) => setState(() {
                  print(data);
                  if (color == Colors.green) {
                    color = Colors.black;
                  } else {
                    color = Colors.green;
                  }
                }))
      ]),
    );
  }
}
