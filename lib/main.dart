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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(routes: [
      GoRoute(path: "/home", builder: (context, state) => const Home()),
      GoRoute(path: "/login", builder: (context, state) => Login()),
    ], initialLocation: false ? '/home' : '/login'); // TODO Check login

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: mainTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
