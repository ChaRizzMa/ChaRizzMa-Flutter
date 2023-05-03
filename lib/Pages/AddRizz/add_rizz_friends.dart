import 'package:flutter/material.dart';

class AddRizzFriends extends StatefulWidget {
  const AddRizzFriends({super.key});

  @override
  State<AddRizzFriends> createState() => _AddRizzFriendsState();
}

class _AddRizzFriendsState extends State<AddRizzFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add a Rizzult to your friend"),
                Form(
                    child: Column(
                  children: [
                    DropdownButtonFormField(
                        items: ["@friend1", "@friend2"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {});
                        }),
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
                                child: Text("Submit Rizzult for @username"))),
                      ),
                    )
                  ],
                ))
              ],
            )),
      ),
    );
    ;
  }
}
