import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:fielamigo_app/screens/onboarding/onboarding_screen.dart';
import 'package:fielamigo_app/screens/user_form_screen/user_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'bloc/user_data_cubit/user_data_cubit.dart';
import 'bloc/verification_code_cubit/verifiaction_code_cubit.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/verification_code/verification_code_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'utils/global_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool("showWelcome") ?? false;
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
        ),
        BlocProvider<VerificationCodeCubit>(
          create: (BuildContext context) => VerificationCodeCubit()
        ),
        BlocProvider<UserDataCubit>(
          create: (BuildContext context) => UserDataCubit()
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
            '/user-form': (context) => const UserFormScreen()
          },
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
          )
        )
      ),
    );
  }
}
