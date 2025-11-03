import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
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
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Forgot Password",
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
                      "Enter your email, we will send a verification code to email",
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Color(0xFFCBD5E1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  CustomElevatedButton(
                    title: "Continue",
                    ontab: () {
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(RoutesNames.reset);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
