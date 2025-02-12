import 'package:ecommerce_app/features/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;
  double scale = 0.0;

  @override
  void initState() {
    super.initState();
    animateLogo();
    navigateToNextScreen();
  }

  void animateLogo() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0; // Range 0.0 , 0.5 , 1.0 (NOT MORE)
        scale = 1.2; // Range 0.0 , 0.5 , 1.0 , 1.5 , 2.0 (NOT MORE)
      });
    });
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: opacity,
          child: AnimatedScale(
            duration: const Duration(seconds: 2),
            scale: scale,
            curve: Curves.bounceInOut,
            child: Image.asset(
              "assets/images/logo.png",
              width: 350,
              height: 600,
            ),
          ),
        ),
      ),
    );
  }
}
