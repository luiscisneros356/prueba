import 'package:flutter/material.dart';

class MyDragableScroll extends StatefulWidget {
  const MyDragableScroll({super.key});

  @override
  State<MyDragableScroll> createState() => _MyDragableScrollState();
}

class _MyDragableScrollState extends State<MyDragableScroll> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        shouldCloseOnMinExtent: true,
        expand: false,
        initialChildSize: 0.3,
        minChildSize: 0.1,
        builder: (context, scrollController) {
          return ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          );
        });
  }
}
