import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({super.key});

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Text("Hello $index");
            },
          ),
        ),
      ),
    );
  }
}
