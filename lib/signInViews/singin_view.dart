import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class SinginView extends StatelessWidget {
  const SinginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: height * .2,
                        width: width * .2,
                        "assets/images/sign_in_icon.png",
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: "Inter_Regular",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Please login first to start your Theory Test.",
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                          fontFamily: "Inter_Regular",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .05),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              textAlign: TextAlign.start,
                              "Email Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                              ).hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            maxLength: 25,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "dummy@gmail.com",
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
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              textAlign: TextAlign.start,
                              "Password",
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
                              controller: passwordController,
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

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.toggleBox.value,
                                    activeColor: Color(0xFF1B6EF7),
                                    onChanged: (bool? newValue) {
                                      controller.rememberBox();
                                    },
                                  );
                                }),
                                Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 14,
                                    fontFamily: "Inter_Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RoutesNames.forget);
                              },
                              child: Text(
                                "Forget Password",
                                style: TextStyle(
                                  color: Color(0xFF64748B),
                                  fontSize: 14,
                                  fontFamily: "Inter_Regular",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CustomElevatedButton(
                      title: "Sign In",
                      ontab: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(RoutesNames.product);
                        }
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New to Theory Test? ",
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(RoutesNames.singUp),
                            child: Text(
                              " Create Account",
                              style: TextStyle(
                                color: Color(0xFF1B6EF7),
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
