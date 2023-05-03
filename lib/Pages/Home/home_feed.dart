import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Rizzults",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_alt),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_add),
              splashRadius: 20,
            ),
          ],
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                // TODO: change the UI according to the data[index]
                onTap: () {
                  // TODO: onClick make activate navigator to detail view and pump in data from data[index]
                  print("clicked on $index");
                },
                leading: SizedBox(
                    width: 50,
                    child: Row(children: [
                      Icon(Icons.arrow_drop_up),
                      Text("+${Random().nextInt(10)}")
                    ])),
                title: Text("@username"),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Time"), Icon(Icons.chevron_right)],
                  ),
                ),
              );
            }));
  }
}
