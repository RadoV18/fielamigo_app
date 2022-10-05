import 'package:fielamigo_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'screens/sign_up_screen.dart';
import 'screens/verification_code_screen.dart';
import 'screens/welcome_screen.dart';
import 'utils/global_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool("showHome") ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
          // theme: GlobalTheme.globalTheme,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                    builder: (context) => showHome
                        ? const WelcomeScreen()
                        : const OnboardingScreen());
              case '/welcome':
                return MaterialPageRoute(
                    builder: (context) => const WelcomeScreen());
              case '/sign-up':
                return MaterialPageRoute(
                    builder: (context) => const SignUpScreen());
              case '/verification-code':
                return MaterialPageRoute(
                  builder: (context) => const VerificationCodeScreen());
            }
            return null;
          }),
    );
  }
}
