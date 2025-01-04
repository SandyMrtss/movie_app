import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabs,
  });
  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorWeight: 2,
        labelPadding: EdgeInsets.all(4),
        labelColor: Colors.amberAccent,
        unselectedLabelColor: const Color(0xFFC8C4AF),
        labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        tabs: tabs,
    );
  }
}