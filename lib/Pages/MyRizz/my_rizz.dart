import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MyRizz extends StatefulWidget {
  const MyRizz({super.key});

  @override
  State<MyRizz> createState() => _MyRizzState();
}

class _MyRizzState extends State<MyRizz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("My Rizz"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
            splashRadius: 20,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: CircularProgressIndicator(
            value: 76,
          ),
        ),
      ),
    );
  }
}
