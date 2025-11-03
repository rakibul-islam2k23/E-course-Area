import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_sm/controller/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.pages.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) => controller.pages[index],
            ),
          ],
        ),
      ),
    );
  }
}
