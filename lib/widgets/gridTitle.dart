import 'package:flutter/material.dart';

class MyGridTitle extends StatelessWidget {
  const MyGridTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const GridTile(
        header: GridTileBar(
          title: Text('Header'),
          subtitle: Text('Subtitle'),
          leading: Icon(Icons.ac_unit),
          trailing: Icon(Icons.ac_unit),
        ),
        footer: GridTileBar(
          title: Text('Footer'),
          subtitle: Text('Subtitle'),
          leading: Icon(Icons.ac_unit),
          trailing: Icon(Icons.ac_unit),
        ),
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
