import 'package:charizzma/Pages/Home/bottom_navbar.dart';
import 'package:charizzma/Pages/Home/listview.dart';
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
        ShellRoute(
          builder: (context, state, child) {
            return ScaffoldWithBottomNavigation(
              child: child,
            );
          },
          routes: [
            GoRoute(
                path: "/home",
                builder: (context, state) {
                  return HomeListView();
                },
                routes: [
                  GoRoute(
                      path: "detail",
                      builder: (context, state) {
                        return Container();
                      })
                ]),
            GoRoute(
              path: "/addrizz",
              builder: (context, state) {
                return Scaffold(
                  body: Center(
                    child: Text("AddRIZZ"),
                  ),
                );
              },
            ),
            GoRoute(
              path: "/myrizz",
              builder: (context, state) {
                return Scaffold(
                  body: Center(
                    child: Text("My Rizz"),
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(path: "/login", builder: (context, state) => Login()),
      ],
      initialLocation: Supabase.instance.client.auth.currentUser != null
          ? '/login'
          : '/home'); // TODO: change back to == null when finished

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
