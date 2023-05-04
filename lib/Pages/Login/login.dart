// ignore_for_file: avoid_print

import 'package:charizzma/Pages/Signup/create_account.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:text_divider/text_divider.dart';

// TODO: Add state functions, edit the styling for it to look good in dark mode.
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _username = TextEditingController();
  var _password = TextEditingController();

  String? _usernameErrorText = null;
  String? _passwordErrorText = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 64),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log Into Your Account",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                          "Please enter your credentials to continue viewing rizz.",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _username,
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Please enter a valid username";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Email Address",
                                errorText: _usernameErrorText,
                                prefixIcon: Icon(Icons.email)),
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _password,
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Password",
                                errorText: _passwordErrorText,
                                prefixIcon: Icon(Icons.lock)),
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print(_username.text);
                                  print(_password.text);

                                  var errorMessage = _signUp();
                                  print("ERROR: $errorMessage");
                                  if (errorMessage != null) {
                                    setState(() {
                                      // TODO: on login fail, display an error text
                                      _usernameErrorText = errorMessage;
                                      _passwordErrorText = errorMessage;
                                    });
                                  }
                                }
                              },
                              child: const Text("Login")),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot your credentials?"),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: TextDivider(text: Text("or")),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.surfaceVariant),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.onSurface)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateAcount(),
                            ));
                      },
                      child: const Text("Create Your Account")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _signUp() {
    var user = Supabase.instance.client.auth
        .signInWithPassword(email: _username.text, password: _password.text)
        .then((value) {
      context.go("/home");
      return null;
    }).catchError((e) {
      print(e);
      return e.toString();
    });
  }
}
