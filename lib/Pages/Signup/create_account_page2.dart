// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:charizzma/Pages/Signup/create_account.dart';
import 'package:charizzma/models/rizz_math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    print(
        "${this.firstName}, ${this.lastname}, ${this.email}, ${this.phoneNumber}, ${this.password}");
  }

  @override
  State<CreateAccountPreferences> createState() =>
      _CreateAccountPreferencesState();
}

class _CreateAccountPreferencesState extends State<CreateAccountPreferences> {
  List<String> pronounList = <String>["He/Him", "She/Hers", "They/Them"];
  // edge case, if they/them orientation list has to change

  String _userPronouns = "";

  List<String> attractionPreference = <String>["Men", "Women", "Other"];

  String _userAttractionPreference = "";

  double _currentSelfRizz = 0.5;
  double _currentSelfAttraction = 0.5;
  int _currentSelfRizzDisplay = 5;
  int _currentSelfAttractionDisplay = 5;

  bool _currentSelfRizzIsSelected = false;
  bool _currentSelfAttractionIsSelected = false;

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
                            setState(() {
                              _userPronouns = value!;
                              print(_userPronouns);
                            });

                            if (value == "They/Them") {}
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DropdownButtonFormField(
                          items: attractionPreference
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _userAttractionPreference = value!;
                              print(_userAttractionPreference);
                            });
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
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PlatformAlertDialog(
                                            title:
                                                const Text('AlertDialog Title'),
                                            content: const Text(
                                                'AlertDialog description'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  try {
                                                    _signUpUser();
                                                  } catch (e) {
                                                    // TODO: something went wrong
                                                  }
                                                  Navigator.popUntil(context,
                                                      (route) => route.isFirst);
                                                },
                                                child: const Text('Login'),
                                              ),
                                            ],
                                          );
                                        }),
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

  void _signUpUser() async {
    var userInstance = await Supabase.instance.client.auth
        .signUp(email: widget.email, password: widget.password, data: {
      "username": widget.username,
      "user_pronouns": _userPronouns,
      "attraction_preference": _userAttractionPreference,
      "initial_self_rizz": _currentSelfRizzDisplay, // value 1-10
      "initial_self_attraction": _currentSelfAttractionDisplay, // value 1-10
      "initial_overall_rizz": RizzCalculations.calculateInitialRizz(
          _currentSelfRizzDisplay.toDouble(),
          _currentSelfAttractionDisplay.toDouble())
    });
  }
}
