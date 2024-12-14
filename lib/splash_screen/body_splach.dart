import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BodySplach extends StatefulWidget {
  const BodySplach({
    super.key,
  });

  @override
  _BodySplachState createState() => _BodySplachState();
}

class _BodySplachState extends State<BodySplach>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width to make responsive sizes
    final screenWidth = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutQuad,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: screenWidth * 0.12, // Responsive image size
            ).animate(
              effects: [
                FadeEffect(duration: 600.ms, curve: Curves.easeInOut),
                ScaleEffect(
                  begin: Offset(0.8, 0.8),
                  end: Offset(1, 1),
                  duration: 600.ms,
                  curve: Curves.easeOutQuad,
                ),
              ],
            ),

            SizedBox(width: screenWidth * 0.02), // Responsive spacing

            Text(
              'AL-MAHABA',
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Responsive text size
                color: Colors.white,
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
                .slideX(begin: -0.1, end: 0, duration: 600.ms),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, curve: Curves.easeInOut).slideY(
        begin: 0.1, end: 0, duration: 600.ms, curve: Curves.easeOutQuad);
  }
}
