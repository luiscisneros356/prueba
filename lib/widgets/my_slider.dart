import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slider(
        onChangeEnd: (value) => print('End: $value'),
        onChangeStart: (value) => print('Start: $value'),
        value: _value,
        activeColor: Colors.red,
        inactiveColor: Colors.blue,
        overlayColor: MaterialStateProperty.all(Colors.green),
        onChanged: (double value) {
          setState(() {
            _value = value;
            // print(value);
          });
        },
        min: 2,
        max: 6,
        divisions: 100,
        label: 'Slider',
      ),
    );
  }
}
