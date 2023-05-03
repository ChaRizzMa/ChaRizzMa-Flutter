import 'package:charizzma/Pages/AddRizz/add_rizz.dart';
import 'package:charizzma/Pages/Home/home_feed.dart';
import 'package:charizzma/Pages/MyRizz/my_rizz.dart';
import 'package:charizzma/Pages/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;

  final screens = const <Widget>[
    HomeFeed(),
    AddRizz(),
    ActivityPage(),
    MyRizz()
  ];

  void _onItemTap(int index) {
    _currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _onItemTap(index);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.plus_one), label: "Add Rizz"),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist), label: "Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Rizz"),
          ],
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
