import 'dart:math';

import 'package:charizzma/Pages/Home/rizzult_type.dart';
import 'package:charizzma/Pages/Home/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  _fetchData() async {
    print("Initial State");
    // fetch all rizz reports here

    Supabase.instance.client
        .from('rizzults')
        .select('*')
        .then((value) => print("VALUE: $value"))
        .catchError((e) => print(e));
  }

  var rizzults = [1, 2, 3, ""]; // TODO: populate data with rizz
  var supabase = Supabase.instance.client;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Rizzults",
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
              return CellTile(
                index: index,
                information: null, //rizzults[index],
              );
            }));
  }
}

class CellTile extends StatelessWidget {
  final index;
  final information;
  const CellTile({super.key, this.index, this.information});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // TODO: change the UI according to the data[index]
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailView(
                  index: index,
                  rizzultInformation: RizzultInformation.fromMap({}))),
        );
        print("clicked on $index");
      },
      leading: SizedBox(
          width: 75,
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
  }
}
