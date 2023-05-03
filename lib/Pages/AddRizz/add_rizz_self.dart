import 'package:flutter/material.dart';

class AddRizzSelf extends StatefulWidget {
  const AddRizzSelf({super.key});

  @override
  State<AddRizzSelf> createState() => _AddRizzSelfState();
}

class _AddRizzSelfState extends State<AddRizzSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: SizedBox(
                              child: Text("Submit Rizzult for Yourself"))),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
