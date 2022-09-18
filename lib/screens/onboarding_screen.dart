import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> listPagesViewModel = [
      PageViewModel(
        title: "Title of first page",
        body:
            "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 10.h,
          ),
        ),
      ),
      PageViewModel(
        title: "Title of first page",
        body:
            "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 10.h,
          ),
        ),
      ),
      PageViewModel(
        title: "Title of first page",
        body:
            "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 10.h,
          ),
        ),
      ),
    ];

    return IntroductionScreen(
      pages: listPagesViewModel,
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.pushNamed(context, '/welcome');
      },
      baseBtnStyle: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      showNextButton: false,
      // doneColor: TextButton.styleFrom(primary: Colors.green),
      // nextColor: TextButton.styleFrom(primary: Colors.blue),
    );
  }
}
