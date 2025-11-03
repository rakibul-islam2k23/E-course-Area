import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonText,
  });
  final String image;
  final String title;
  final String subTitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final controller = Get.put(OnboardingController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Image.asset(image)),
              SizedBox(height: height * .1),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: width * .6,
                          child: Text(
                            textAlign: TextAlign.center,
                            title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF636F85),
                            fontSize: 14,
                            fontFamily: "Inter_Regular",
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(controller.pages.length, (
                            index,
                          ) {
                            final isActive =
                                index == controller.currentPage.value;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color:
                                    isActive
                                        ? Color(0xFF1B6EF7)
                                        : Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    CustomElevatedButton(
                      title: buttonText,
                      ontab: () {
                        controller.nextPage();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
