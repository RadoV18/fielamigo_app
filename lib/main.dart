import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/bloc/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:fielamigo_app/screens/add_payment_method/add_payment_method_screen.dart';
import 'package:fielamigo_app/screens/boarding_form/boarding_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_bookings_edit/caregiver_bookings_edit_screen.dart';
import 'package:fielamigo_app/screens/caregiver_home/caregiver_home_screen.dart';
import 'package:fielamigo_app/screens/caregiver_new_bookings/caregiver_new_bookings_screen.dart';
import 'package:fielamigo_app/screens/login/login_screen.dart';
import 'package:fielamigo_app/screens/onboarding/onboarding_screen.dart';
import 'package:fielamigo_app/screens/owner_add_pet/owner_add_pet.dart';
import 'package:fielamigo_app/screens/owner_bookings/owner_bookings_screen.dart';
import 'package:fielamigo_app/screens/owner_bookings_edit/owner_bookings_edit_screen.dart';
import 'package:fielamigo_app/screens/owner_home/owner_home_screen.dart';
import 'package:fielamigo_app/screens/owner_pets/owner_pets_screen.dart';
import 'package:fielamigo_app/screens/payment_methods/payment_methods_screen.dart';
import 'package:fielamigo_app/screens/profile/profile_screen.dart';
import 'package:fielamigo_app/screens/profile_personal_information/profile_personal_information.dart';
import 'package:fielamigo_app/screens/profile_user_address/profile_user_address.dart';
import 'package:fielamigo_app/screens/search_results/search_results_screen.dart';
import 'package:fielamigo_app/screens/user_form_screen/user_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'bloc/caregiver_services_form_cubit/caregiver_services_form_cubit.dart';
import 'bloc/log_in_cubit/log_in_cubit.dart';
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
            create: (BuildContext context) => SignUpCubit()),
        BlocProvider<VerificationCodeCubit>(
            create: (BuildContext context) => VerificationCodeCubit()),
        BlocProvider<UserDataCubit>(
            create: (BuildContext context) => UserDataCubit()),
        BlocProvider<LogInCubit>(
            create: (BuildContext context) => LogInCubit()),
        BlocProvider<BottomNavBarCubit>(
            create: (BuildContext context) => BottomNavBarCubit()),
        BlocProvider<AddPetCubit>(
            create: (BuildContext context) => AddPetCubit()),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
                  theme: GlobalTheme.globalTheme,
                  initialRoute: '/',
                  routes: {
                    '/': (context) => showHome
                        ? const WelcomeScreen()
                        : const OnboardingScreen(),
                    '/welcome': (context) => const WelcomeScreen(),
                    '/sign-up': (context) => const SignUpScreen(),
                    '/log-in': (context) => const LoginScreen(),
                    '/verification-code': (context) =>
                        const VerificationCodeScreen(),
                    '/owner/home': (context) => const OwnerHomeScreen(),
                    '/owner/bookings': (context) => const OwnerBookingsScreen(),
                    '/owner/bookings/edit': (context) =>
                        const OwnerBookingsEditScreen(
                          service: 'Entrenamiento',
                          userId: 1,
                        ),
                    '/owner/boarding': (context) => const BoardingFormScreen(),
                    '/owner/pets': (context) => const OwnerPetsScreen(),
                    '/owner/pets/new': (context) => const OwnerAddPetScreen(),
                    '/owner/profile': (context) => const ProfileScreen(),
                    '/profile/personal-information': (context) =>
                        const ProfilePersonalInformationScreen(),
                    '/profile/address': (context) =>
                        const ProfileUserAddressScreen(),
                    '/profile/payment-methods': (context) =>
                        const PaymentMethodsScreen(),
                    '/payment-methods/add': (context) =>
                        const AddPaymentMethodScreen(),
                    '/search-results': (context) => const SearchResultsScreen(),
                    '/user-form': (context) => const UserFormScreen(),
                    '/caregiver/home': ((context) =>
                        CaregiverHomeScreen()), //TODO change this
                    '/caregiver/bookings/new': ((context) =>
                        const CaregiverNewBookingsScreen()),
                    '/caregiver/bookings/edit': (context) =>
                        const CaregiverBookingsEditScreen(
                          service: 'Paseo',
                          userId: 1,
                        ),
                  })),
    );
  }
}
