import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    print('Drawer init');
    print("HOLALALALALALA");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text('Drawer Header', style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text('Drawer Header', style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Center(
            child: ElevatedButton(
          onPressed: () async {
            Scaffold.of(context).openDrawer();
            await Future.delayed(const Duration(seconds: 1));
            if (mounted) Scaffold.of(context).closeDrawer();
            await Future.delayed(const Duration(seconds: 1));

            if (mounted) Scaffold.of(context).openEndDrawer();
            await Future.delayed(const Duration(seconds: 1));

            if (mounted) Scaffold.of(context).closeEndDrawer();
            await Future.delayed(const Duration(seconds: 1));

            if (mounted) {
              Scaffold.of(context).showBottomSheet((context) => Container(
                    height: 200,
                    color: Colors.blue,
                  ));
            }
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);

            if (mounted) Scaffold.of(context).showBodyScrim(true, 0.8);
            await Future.delayed(const Duration(seconds: 1));
            Scaffold.of(context).showBodyScrim(false, 0.8);

            await Future.delayed(const Duration(seconds: 1));
            Scaffold.of(context).setState(() {
              print('Scaffold state');
            });
            ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
              content: const Text('Banner'),
              actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                  child: const Text('Hide'),
                )
              ],
            ));

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));

            await Future.delayed(const Duration(seconds: 1));
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            await Future.delayed(const Duration(seconds: 1));

            // if (mounted) {
            //   Scaffold.of(context).initState();
            // }
          },
          child: const Text('Open Drawer'),
        )),
      ),
    );
  }
}
