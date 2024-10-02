import 'package:flutter/cupertino.dart';

class MyCupertinoContextMenu extends StatelessWidget {
  const MyCupertinoContextMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoContextMenuAction(
        trailingIcon:
            const IconData(0xf3d2, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage),
        isDestructiveAction: true,
        child: CupertinoContextMenuAction(
          child: const Text('Action 1'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
