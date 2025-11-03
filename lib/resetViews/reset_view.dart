import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';
import 'package:task_sm/widgets/success_alert.dart';

class ResetView extends StatelessWidget {
  const ResetView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final _formKey = GlobalKey<FormState>();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final controller = Get.put(OnboardingController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter_Regular",
                        fontSize: 24,
                      ),
                    ),

                    Container(
                      width: width * .8,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Your password must be at least 8 characters long and include a combination of letters, numbers",
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontFamily: "Inter_Regular",
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .05),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            textAlign: TextAlign.start,
                            "New Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Obx(() {
                          return TextFormField(
                            controller: newPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                            onTap: () {
                              controller.toggleVisivility();
                            },
                            obscureText: controller.toggleValue.value,
                            keyboardType: TextInputType.visiblePassword,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "pass****",
                              suffixIconColor: Color(0xFF64748B),

                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  controller.toggleValue.value == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: height * .03),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            textAlign: TextAlign.start,
                            "Confirm New Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Obx(() {
                          return TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                            onTap: () {
                              controller.toggleVisivility();
                            },
                            obscureText: controller.toggleValue.value,
                            keyboardType: TextInputType.visiblePassword,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "pass****",
                              suffixIconColor: Color(0xFF64748B),

                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  controller.toggleValue.value == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: height * .03),
                    CustomElevatedButton(
                      title: "Continue",
                      ontab: () {
                        if (_formKey.currentState!.validate()) {
                          if (newPasswordController.text ==
                              confirmPasswordController.text) {
                            Get.dialog(
                              Center(
                                child: Material(
                                  color: Colors.transparent,
                                  child: CustomAlertDialog(
                                    onButtonPressed: () {
                                      Get.toNamed(RoutesNames.signIn);
                                    },
                                    image: "assets/images/reset_alert.png",
                                    title: "Success",
                                    message:
                                        "Your password is succesfully created",
                                    buttonText: "Continue",
                                  ),
                                ),
                              ),
                              barrierDismissible: false,
                            );
                          } else {
                            Get.snackbar(
                              "Wrong",
                              "Email and Password are not matched",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
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
