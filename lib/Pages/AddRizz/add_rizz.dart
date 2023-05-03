import 'package:charizzma/Pages/AddRizz/add_rizz_friends.dart';
import 'package:charizzma/Pages/AddRizz/add_rizz_self.dart';
import 'package:flutter/material.dart';

class AddRizz extends StatefulWidget {
  const AddRizz({super.key});

  @override
  State<AddRizz> createState() => _AddRizzState();
}

class _AddRizzState extends State<AddRizz> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: const TabBar(tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Yourself"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Friends"),
              )
            ]),
          ),
          body: const TabBarView(
            children: [AddRizzSelf(), AddRizzFriends()],
          )),
    );
  }
}
