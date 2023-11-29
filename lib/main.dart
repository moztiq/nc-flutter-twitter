import 'package:flutter/material.dart';
import 'package:nc_flutter_twitter/features/authentication/signup_intro_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFF5FA7F5),
          appBarTheme: const AppBarTheme(
            foregroundColor: Color(0xFF5FA7F5),
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      home: const SignupIntroScreen(),
    );
  }
}
