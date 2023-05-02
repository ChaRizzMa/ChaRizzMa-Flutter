import 'dart:ffi';

import 'package:charizzma/Pages/Signup/create_account.dart';
import 'package:flutter/material.dart';

class CreateAccountPreferences extends StatefulWidget {
  final String firstName, lastname, email, phoneNumber, username, password;

  CreateAccountPreferences(
      {super.key,
      required this.firstName,
      required this.lastname,
      required this.email,
      required this.phoneNumber,
      required this.username,
      required this.password}) {
    // debug print("${this.firstName}, ${this.lastname}");
  }

  @override
  State<CreateAccountPreferences> createState() =>
      _CreateAccountPreferencesState();
}

class _CreateAccountPreferencesState extends State<CreateAccountPreferences> {
  List<String> pronounList = <String>["He/Him", "She/Hers", "They/Them"];
  // edge case, if they/them orientation list has to change

  List<String> orientation = <String>[
    "Heterosexual",
    "Homosexual",
    "Bi-Sexual"
  ];

  double _currentSelfRizz = 0.5;
  double _currentSelfAttraction = 0.5;
  int _currentSelfRizzDisplay = 5;
  int _currentSelfAttractionDisplay = 5;

  bool _currentSelfRizzIsSelected = false;
  bool _currentSelfAttractionIsSelected = false;

  void _signUpUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 64),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      // Title
                      Text(
                        "About Yourself",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "This is to help us better understand who you are in order to calculate your intial rizz.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DropdownButtonFormField(
                          items: pronounList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {});
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DropdownButtonFormField(
                          items: orientation
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {});
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: _currentSelfRizzIsSelected
                                    ? Theme.of(context).colorScheme.onBackground
                                    : Theme.of(context).unselectedWidgetColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "How much rizz do you think you have?"),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Slider(
                                          onChangeStart: (_) {
                                            _currentSelfRizzIsSelected = true;
                                          },
                                          onChangeEnd: (_) {
                                            _currentSelfRizzIsSelected = false;
                                          },
                                          divisions: 10,
                                          value: _currentSelfRizz,
                                          onChanged: (double value) {
                                            setState(() {
                                              _currentSelfRizz = value;
                                              _currentSelfRizzDisplay =
                                                  (10 * _currentSelfRizz)
                                                      .toInt();
                                            });
                                          })),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "$_currentSelfRizzDisplay/10",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: _currentSelfAttractionIsSelected
                                    ? Theme.of(context).colorScheme.onBackground
                                    : Theme.of(context).unselectedWidgetColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "How attractive do you think you are?"),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Slider(
                                          onChangeStart: (_) {
                                            _currentSelfAttractionIsSelected =
                                                true;
                                          },
                                          onChangeEnd: (_) {
                                            _currentSelfAttractionIsSelected =
                                                false;
                                          },
                                          divisions: 10,
                                          value: _currentSelfAttraction,
                                          onChanged: (double value) {
                                            setState(() {
                                              _currentSelfAttraction = value;
                                              _currentSelfAttractionDisplay =
                                                  (10 * _currentSelfAttraction)
                                                      .toInt();
                                            });
                                          })),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                            "${_currentSelfAttractionDisplay}/10",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16)),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SizedBox(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .surfaceVariant),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onSurface)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Back")),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SizedBox(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Create Account")),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ]),
        ),
      ),
    );
  }
}
