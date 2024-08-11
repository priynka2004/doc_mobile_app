import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/Onboarding/secondscreen.dart';


class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _first = true;
  bool _showSecondImage = true;
  bool _showThirdImage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _first = false;
        _controller.forward();
        Timer(const Duration(seconds: 2), () {
          setState(() {
            _showThirdImage = true;
            _showSecondImage = false;
          });
          Timer(const Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) => const SecondScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFF53CFAC),
              ],
              stops: [0.0, 0.48, 1.0],
            ),
          ),
        ),
        Center(
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild: _showSecondImage
                ? Transform.scale(
                    scale: 0.8,
                    child: Image.asset(
                      'assets/homeimages/onboarding/icon.png',
                    ),
                  )
                : const SizedBox(),
            secondChild: _showSecondImage
                ? Transform.scale(
                    scale: 0.8,
                    child: Image.asset(
                      'assets/homeimages/onboarding/logo.png',
                    ),
                  )
                : const SizedBox(),
            crossFadeState: _first
                ? CrossFadeState.showFirst
                : _showSecondImage
                    ? CrossFadeState.showSecond
                    : CrossFadeState
                        .showFirst,
          ),
        ),
        if (_showThirdImage)
          Center(
            child: Transform.scale(
              scale: 0.8,
              child: ScaleTransition(
                scale: _controller,
                child: Image.asset(
                  'assets/homeimages/onboarding/logo_text.png',
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}