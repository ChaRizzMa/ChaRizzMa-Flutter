import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavigation extends StatefulWidget {
  const ScaffoldWithBottomNavigation({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  State<ScaffoldWithBottomNavigation> createState() =>
      _ScaffoldWithBottomNavigationState();
}

class _ScaffoldWithBottomNavigationState
    extends State<ScaffoldWithBottomNavigation> {
  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  final tabs = [
    const ScaffoldWithNavBarTabItem(
        initialLocation: '/home', icon: Icon(Icons.home), label: "Home"),
    const ScaffoldWithNavBarTabItem(
        initialLocation: '/addrizz',
        icon: Icon(Icons.plus_one),
        label: "Add Rizz"),
    const ScaffoldWithNavBarTabItem(
        initialLocation: '/myrizz', icon: Icon(Icons.person), label: "My Rizz")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //New
        onTap: (index) => _onItemTapped(context, index),
        items: tabs,
      ),
      body: Center(child: widget.child),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required Widget icon,
      required String label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
