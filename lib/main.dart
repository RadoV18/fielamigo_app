import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/sign_up_screen.dart';
import 'screens/welcome_screen.dart';
import 'utils/global_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: GlobalTheme.globalTheme,
        onGenerateRoute: (RouteSettings settings) {
          switch(settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => const WelcomeScreen());
            case '/sign-up':
              return MaterialPageRoute(builder: (context) => const SignUpScreen());
          }
          return null;
        }
      ),
    );
  }
}