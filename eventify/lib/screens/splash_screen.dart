// ignore_for_file: use_build_context_synchronously

import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _logoController.forward();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _progressController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, Color(0xff00F8FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: media.width * 0.18,
                  child: Padding(
                    padding: EdgeInsets.all(media.width * 0.02),
                    child: Image.asset(
                      'assets/app_logo.png',
                      fit: BoxFit.contain,
                      height: media.height * 0.15,
                      width: media.width * 0.35,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: media.height * 0.05),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "Eventify - Organize Smarter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: media.width * 0.045,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            SizedBox(height: media.height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.08,
                vertical: media.height * 0.02,
              ),
              child: AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _progressController.value,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(whiteColor),
                    minHeight: media.height * 0.008,
                    borderRadius: BorderRadius.all(
                      Radius.circular(media.width * 0.025),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
