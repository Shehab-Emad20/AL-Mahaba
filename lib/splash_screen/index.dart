import 'package:almahaba/splash_screen/body_splach.dart';
import 'package:almahaba/home/body_page.dart';
import 'package:almahaba/utils/cashe_helper.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start from the left
      end: Offset.zero, // End at the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start the animation
    _controller.forward();

    String? token = CacheHelper.getString('token');
    KToken = token;
    // Navigate to LoginPage after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BodyPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFfb2c2c),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child:
              const BodySplach(), // Replace this with your logo or desired widget
        ),
      ),
    );
  }
}
