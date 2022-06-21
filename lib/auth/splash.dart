// import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/allcolors.dart';
import 'package:ecommerce_app/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: AnimatedSplashScreen(
        backgroundColor: AllColors.primarycolor,
        splashIconSize: 200,
        duration: 600,
        splashTransition: SplashTransition.fadeTransition,
        splash: "images/image_logo.png",
        nextScreen: Register(),
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
