import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:swachhta_app2/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 33, 202, 165),
            Color.fromARGB(255, 21, 84, 35)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 350,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/logo2.png',
                    // width: 500,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText("Swachhta",
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 2, 15, 11),
                            fontSize: 40,
                          ),
                          fadeInEnd: 1,
                          fadeOutBegin: 2),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 320,
              ),
              const Text(
                "One step towards cleanliness",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 0, 0),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
