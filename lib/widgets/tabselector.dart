import 'package:flutter/material.dart';

class MyTabSelector extends StatefulWidget {
  const MyTabSelector({super.key});

  @override
  State<MyTabSelector> createState() => _MyTabSelectorState();
}

class _MyTabSelectorState extends State<MyTabSelector> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final int _selectedIndex = 0;

  List<Widget> myContainer = [
    const MyCustomBody(icon: Icons.ac_unit_rounded, color: Colors.red),
    const MyCustomBody(icon: Icons.ac_unit, color: Colors.blue),
    const MyCustomBody(icon: Icons.zoom_out_map_sharp, color: Colors.green),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: _selectedIndex,
      animationDuration: const Duration(seconds: 1),
    );

    _tabController.addListener(() {
      // Add listener to the animation
      _tabController.animation?.status == AnimationStatus.completed
          ? print('Animation completed')
          : print('Animation is not completed');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: myContainer,
          ),
          // Positioned(
          //   bottom: 40,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       _tabController.animateTo((_tabController.index + 1) % 3);
          //     },
          //     child: const Icon(Icons.arrow_forward),
          //   ),
          // ),

          Positioned(
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo((_tabController.index + 1) % 3);
                  },
                  child: const Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo((_tabController.index - 1) % 3);
                  },
                  child: const Text('Previous'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomBody extends StatelessWidget {
  const MyCustomBody({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 200,
      ),
    );
  }
}
