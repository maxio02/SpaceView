import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_view/pages/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Wait for a short duration before navigating to the main screen
        Future.delayed(Duration(milliseconds: 500), () {
          _controller.reverse();
          // Navigate to the home screen using PageRouteBuilder for smooth transition
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: const Mainscreen(),
                );
              },
              transitionDuration: Duration(milliseconds: 2000),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Add a custom SVG icon
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter, // Adjust alignment as needed
                  child: SvgPicture.asset(
                    'assets/vectors/logo_no_bg_dark_with_text.svg',
                    width: 300,
                  ),
                ),
                SizedBox(height: 370),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
