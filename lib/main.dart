import 'package:charizzma/Pages/Home/home.dart';
import 'package:charizzma/Pages/Login/login.dart';
import 'package:charizzma/Pages/Signup/create_account.dart';
import 'package:charizzma/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  var dbURL = dotenv.env['DB_URL'];
  var anonKey = dotenv.env['ANON_KEY'];

  await Supabase.initialize(
    url: dbURL!,
    anonKey: anonKey!,
  );

  print("Current User");
  print(Supabase.instance.client.auth.currentUser?.email);

  runApp(MyApp());
}

// The DismissKeybaord widget (it's reusable)
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  GoRouter router = GoRouter(
      routes: [
        GoRoute(path: "/home", builder: (context, state) => const Home()),
        GoRoute(path: "/login", builder: (context, state) => Login()),
      ],
      initialLocation: Supabase.instance.client.auth.currentUser == null
          ? '/login'
          : '/home');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO Check login

    return DismissKeyboard(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: mainTheme,
        darkTheme: darkTheme,
        routerConfig: router,
      ),
    );
  }
}
