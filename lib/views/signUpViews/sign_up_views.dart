import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';
import 'package:task_sm/widgets/success_alert.dart';

class SignUpViews extends StatelessWidget {
  const SignUpViews({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    final height = MediaQuery.sizeOf(context).height;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController usernameCOntroller = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black.withOpacity(.4)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * .04),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Eduline",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's join to Eduline learning ecosystem & meet our professional mentor. It’s Free!",
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * .02),
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
                              "Full Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: usernameCOntroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "User Name is required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "Demo333",
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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
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
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "At least 8 characters with a combination of letters and numbers",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontFamily: "Inter_Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * .05),

                Column(
                  children: [
                    CustomElevatedButton(
                      title: "Sign Up",
                      ontab: () {
                        if (_formKey.currentState!.validate()) {
                          Get.dialog(
                            Center(
                              child: Material(
                                color: Colors.transparent,
                                child: CustomAlertDialog(
                                  onButtonPressed: () {
                                    Get.toNamed(RoutesNames.enableLocation);
                                  },
                                  image: "assets/images/success_alert.png",
                                  title: "Registration Successful",
                                  message:
                                      "Your account has been registered successfully,now let's enjoy our feathers!",
                                  buttonText: "Continue",
                                ),
                              ),
                            ),
                            barrierDismissible: false,
                          );
                        }
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 14,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(RoutesNames.signIn),
                            child: Text(
                              " Sign In",
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
