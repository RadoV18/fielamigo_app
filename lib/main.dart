import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => WelcomeScreen());
          case '/sign-up':
            return MaterialPageRoute(builder: (context) => SignUpScreen());
        }
      }
    );
  }
}