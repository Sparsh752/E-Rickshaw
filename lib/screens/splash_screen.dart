// ignore_for_file: unused_import, unnecessary_import, implementation_imports, prefer_const_constructors, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:erickshaw/screens/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/logo7.png',
          ),
          backgroundColor: Colors.black,
          splashIconSize: double.infinity,
          nextScreen: Landing(),
          splashTransition: SplashTransition.scaleTransition,
          duration: 2500,
          pageTransitionType: PageTransitionType.leftToRight,
        ));
  }
}
