import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:fielamigo_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/verification_code/verification_code_screen.dart';
import 'screens/welcome/welcome_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit()
        )
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          // theme: GlobalTheme.globalTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => showHome
                        ? const WelcomeScreen()
                        : const OnboardingScreen(),
            '/welcome': (context) => const WelcomeScreen(),
            '/sign-up': (context) => const SignUpScreen(),
            '/verification-code': (context) => const VerificationCodeScreen(),
          }
        )
      ),
    );
  }
}
