import 'package:fielamigo_app/bloc/add_payment_method_cubit/add_payment_method_cubit.dart';
import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:fielamigo_app/bloc/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import 'package:fielamigo_app/bloc/caregiver_services_form_cubit/caregiver_services_form_cubit.dart';
import 'package:fielamigo_app/bloc/payment_methods_cubit/payment_methods_cubit.dart';
import 'package:fielamigo_app/bloc/profile_picture_cubit/profile_picture_cubit.dart';
import 'package:fielamigo_app/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:fielamigo_app/screens/add_payment_method/add_payment_method_screen.dart';
import 'package:fielamigo_app/screens/boarding_confirmation/boarding_confirmation_screen.dart';
import 'package:fielamigo_app/screens/boarding_form/boarding_form_screen.dart';
import 'package:fielamigo_app/screens/caregiver_biography/caregiver_biography_screen.dart';
import 'package:fielamigo_app/screens/caregiver_booking_request/caregiver_booking_request_screen.dart';
import 'package:fielamigo_app/screens/caregiver_bookings_edit/caregiver_bookings_edit_screen.dart';
import 'package:fielamigo_app/screens/caregiver_completed_bookings/caregiver_completed_bookings_screen.dart';
import 'package:fielamigo_app/screens/caregiver_home/caregiver_home_screen.dart';
import 'package:fielamigo_app/screens/caregiver_new_bookings/caregiver_new_bookings_screen.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/caregiver_services_form.dart';
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
import 'package:fielamigo_app/screens/select_payment_method/select_payment_method_screen.dart';
import 'package:fielamigo_app/screens/user_form_screen/user_form_screen.dart';
import 'package:fielamigo_app/utils/token_utils.dart';
import 'package:fielamigo_app/widgets/pet_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'bloc/boarding_cubit/boarding_cubit.dart';
import 'bloc/dog_cubit/dog_cubit.dart';
import 'bloc/user_data_cubit/user_data_cubit.dart';
import 'bloc/user_info_cubit/user_info_cubit.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/verification_code/verification_code_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'utils/global_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool showHome = prefs.getBool("showWelcome") ?? false;

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final bool hasToken = await storage.containsKey(key: "token");
  bool redirectToHomeScreen = false;
  bool isOwner = false;
  if(hasToken) {
    String? token = await storage.read(key: "token");
    redirectToHomeScreen = TokenUtils.isTokenValid(token!);
    isOwner = TokenUtils.checkIsOwner(token);
  }
  runApp(MyApp(
    showHome: showHome,
    redirectToHomeScreen: redirectToHomeScreen,
    isOwner: isOwner,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  final bool redirectToHomeScreen;
  final bool isOwner;

  const MyApp({
    Key? key,
    required this.showHome,
    required this.redirectToHomeScreen,
    required this.isOwner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserInfoCubit>(
          create: (context) => UserInfoCubit()..init(),
        ),
        BlocProvider<ProfilePictureCubit>(
          create: (context) => ProfilePictureCubit()..init(),
        ),
        BlocProvider(create: (context) => CaregiverServicesFormCubit()),
        BlocProvider<BoardingCubit>(
          create: (context) => BoardingCubit(),
        ),
        BlocProvider<SignUpCubit>(
            create: (BuildContext context) => SignUpCubit()),
        BlocProvider<UserDataCubit>(
            create: (BuildContext context) => UserDataCubit()),
        BlocProvider<BottomNavBarCubit>(
            create: (BuildContext context) => BottomNavBarCubit()),
        BlocProvider<AddPetCubit>(
            create: (BuildContext context) => AddPetCubit()),
        BlocProvider<PaymentMethodsCubit>(create: (BuildContext context) => PaymentMethodsCubit()..init()),
        BlocProvider(create: (BuildContext context) => AddPaymentMethodCubit()),
        BlocProvider<DogCubit>(create: (BuildContext context) => DogCubit()..init),
        BlocProvider(create: (BuildContext context) => BioFeaturesCubit()..init()),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
                  theme: GlobalTheme.globalTheme,
                  initialRoute: redirectToHomeScreen ?
                    isOwner ? '/owner/home' : '/caregiver/home' : '/',
                  routes: {
                    '/': (context) {
                      return showHome ? WelcomeScreen() : OnboardingScreen();
                    },
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
                    '/payment-methods/add': (context) => AddPaymentMethodScreen(),
                    '/search-results': (context) => const SearchResultsScreen(),
                    // '/user-form': (context) => const UserFormScreen(),
                    '/caregiver/home': ((context) =>
                        const CaregiverHomeScreen()), //TODO change this
                    '/caregiver/biography': (context) => CaregiverBiographyScreen(),
                    '/caregiver/bookings/new': ((context) =>
                        const CaregiverNewBookingsScreen()),
                    '/caregiver/bookings/edit': (context) =>
                        const CaregiverBookingsEditScreen(
                          service: 'Paseo',
                          userId: 1,
                        ),
                    '/caregiver/services-form': (context) => const CareGiverServicesFormScreen(),
                    '/caregiver/bookings/request': ((context) =>
                        const CaregiverBookingRequestScreen()),
                    '/caregiver/bookings/completed': ((context) =>
                        const CaregiverCompletedBookingsScreen()),
                    '/owner/pets/info': ((context) => const PetInfo()),
                    '/select-payment-method': ((context) => const SelectPaymentMethodScreen()),
                    '/boarding-confirmation':(context) => const BoardingConfirmationScreen(),
                  })),
    );
  }
}
