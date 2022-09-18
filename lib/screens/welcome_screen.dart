import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/welcome.mp4");
    _controller.initialize().then((_) {
      _controller.setVolume(0);
      _controller.setLooping(true);
      _controller.play();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      fixedSize: Size(80.w, 5.h),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        side: BorderSide(color: Colors.white),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: VideoPlayer(_controller)),
                ),
                Container(
                  // black overlay
                  color: Colors.black.withAlpha(5000),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 20.h,
                ),
                SizedBox(
                  height: 45.h,
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {},
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    _controller.dispose();
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  child:
                      Text('Regístrate', style: TextStyle(fontSize: 15.sp)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
