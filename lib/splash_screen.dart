import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final onboardingController = Get.put(OnboardingController());
  final storage = GetStorage();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (onboardingController.hasSeenOnboarding()) {
        Get.offAllNamed(RoutesNames.signIn);
      } else {
        Get.offAllNamed(RoutesNames.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash_screen_icon.png",
                      width: width * .4,
                      height: height * .2,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Theory test in my language",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: "Figtree_Bold",
                      ),
                    ),
                    SizedBox(height: height * .01),
                    Text(
                      textAlign: TextAlign.center,
                      "I must write the real test will be in English language and this app just helps you to understand the materials in your language",
                      style: TextStyle(
                        color: Color(0xFF636F85),
                        fontSize: 14,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
              SpinKitCircle(color: Color(0xFF1B6EF7), size: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
