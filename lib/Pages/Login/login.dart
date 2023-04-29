import 'package:charizzma/Pages/Signup/create_account.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
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
                          decoration: const InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                          ),
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
                          decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 16.0,
                                  right: 16.0)),
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
                                _username.clear();
                                _password.clear();
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
                    child: const Text("Forgot your password?"),
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
    );
  }
}
