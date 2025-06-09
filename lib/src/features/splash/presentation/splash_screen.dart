import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:cercle_mystique/src/routing/app_router.dart'; // For homeScreenPath

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<AlignmentGeometry> _gradientAlignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Animate gradient from top left to bottom right then reverse
    _gradientAlignmentAnimation = TweenSequence<AlignmentGeometry>([
      TweenSequenceItem(
          tween: AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_controller);


    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to home screen after animation completes
        if (mounted) {
          context.go(homeScreenPath);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Example gradient, can be themed later
                colors: const [Color(0xFF1a237e), Color(0xFF673ab7), Color(0xFFf06292)],
                stops: const [0.0, 0.5, 1.0],
                begin: _gradientAlignmentAnimation.value,
                end: Alignment(-_gradientAlignmentAnimation.value.x, -_gradientAlignmentAnimation.value.y), // Opposite alignment
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Placeholder for Moon/Sun Logo
                  const Icon(
                    Icons.nightlight_round, // Placeholder icon
                    size: 100.0,
                    color: Colors.white, // Placeholder color
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 250, // Width of the text area
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Placeholder color
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Cercle Mystique',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        totalRepeatCount: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: _progressAnimation.value,
                      strokeWidth: 6.0,
                      backgroundColor: Colors.white.withOpacity(0.3), // Placeholder color
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white), // Placeholder color
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
