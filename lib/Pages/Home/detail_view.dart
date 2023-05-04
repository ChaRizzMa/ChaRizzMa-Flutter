import 'package:charizzma/Pages/Home/rizzult_type.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final RizzultInformation rizzultInformation;
  final int index;
  const DetailView(
      {Key? key, required this.rizzultInformation, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rizzults"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("next page $index"),
        ),
      ),
    );
  }
}
