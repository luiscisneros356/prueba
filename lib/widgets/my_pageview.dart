import 'package:flutter/material.dart';

import 'tabselector.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
      keepPage: false,
    );

    _pageController.addListener(() {
      print('Page: ${_pageController.page}');
      print('Page: ${_pageController.position.userScrollDirection}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        InkWell(
            onTap: () {
              _pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
            },
            child: const MyCustomBody(icon: Icons.zoom_out_outlined, color: Colors.red)),
        InkWell(
            onTap: () {
              _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
            },
            child: const MyCustomBody(icon: Icons.ac_unit, color: Colors.blue)),
        InkWell(
            onTap: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ShowDialogAndOther()),
              // );

              await _pageController.animateTo(2.5, duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
            },
            child: const MyCustomBody(icon: Icons.workspace_premium_outlined, color: Colors.green)),
      ],
    );
  }
}
