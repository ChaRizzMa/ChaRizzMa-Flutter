import 'package:charizzma/Pages/Signup/create_account_page2.dart';
import 'package:flutter/material.dart';

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fn = TextEditingController();
  final TextEditingController _ln = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64),
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
                        "Create Account",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "Enter your contact Infomation",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _fn,
                            decoration: const InputDecoration(
                              labelText: "First Name",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _ln,
                            decoration: const InputDecoration(
                              labelText: "Last Name",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              labelText: "Email Address",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _phone,
                            decoration: const InputDecoration(
                              labelText: "Phone Number",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _username,
                            decoration: const InputDecoration(
                              labelText: "Username",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _password,
                            decoration: const InputDecoration(
                              labelText: "Password",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _confirmPassword,
                            decoration: const InputDecoration(
                              labelText: "Confirm Password",
                            ),
                            validator: (String? str) {
                              if (str == null || str.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, bottom: 64),
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
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .surfaceVariant),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
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
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // pass data into next page of application
                                            print(
                                                "$_fn, $_ln,$_email,$_phone,$_username,$_password,");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CreateAccountPreferences(
                                                          firstName: _fn.text,
                                                          lastname: _ln.text,
                                                          email: _email.text,
                                                          phoneNumber:
                                                              _phone.text,
                                                          username:
                                                              _username.text,
                                                          password:
                                                              _password.text,
                                                        )));
                                          }
                                        },
                                        child: const Text("Next")),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
