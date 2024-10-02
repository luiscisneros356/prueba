import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogAndOther extends StatefulWidget {
  const ShowDialogAndOther({super.key});

  @override
  State<ShowDialogAndOther> createState() => _ShowDialogAndOtherState();
}

class _ShowDialogAndOtherState extends State<ShowDialogAndOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Dialogs and Others'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        icon: const Icon(Icons.ac_unit),
                        title: const Text('Dialog'),
                        content: const Text('This is a dialog'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              },
              child: const Text('Show Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text('Dialog'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Option 1'),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Option 2'),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Option 3'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Show Simple Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                        backgroundColor: Colors.red,
                        insetAnimationCurve: Curves.bounceIn,
                        insetAnimationDuration: Duration(seconds: 1),
                        child: Text('Close'),
                      );
                    });
              },
              child: const Text('Show Adaptive Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showBottomSheet(
                    constraints: const BoxConstraints(maxHeight: 200),
                    shape: Border.all(color: Colors.red),
                    context: context,
                    builder: (context) {
                      return Container();
                    });
              },
              child: const Text('Show showBottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Dialog'),
                        content: const Text('This is a dialog'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              },
              child: const Text('Show showModalBottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: const Text('Action Sheet'),
                        message: const Text('This is an action sheet'),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Action 1'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Action 2'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Action 3'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Show showCupertinoModalPopup'),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Dialog'),
                        content: const Text('This is a dialog'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              },
              child: const Text('Show showCupertinoDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: 'Barrier',
                    barrierColor: Colors.black,
                    transitionDuration: const Duration(seconds: 1),
                    transitionBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AlertDialog(
                        title: const Text('Dialog'),
                        content: const Text('This is a dialog'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              },
              child: const Text('Show showGeneralDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
