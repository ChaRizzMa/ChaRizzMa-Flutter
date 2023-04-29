import 'package:flutter/material.dart';

// TODO: Add state functions, edit the styling for it to look good in dark mode.
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      "Login",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                        "Please enter your credentials to continue viewing rizz.",
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  ),
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16.0, right: 16.0)),
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Login")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot your password?"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
