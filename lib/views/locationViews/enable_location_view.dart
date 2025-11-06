import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class EnableLocationView extends StatelessWidget {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Maps.png",
                height: height * .2,
                width: width * .2,
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Enable Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: "Inter_Regular",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: width * .7,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * .03),

              CustomElevatedButton(
                title: "Enable",
                ontab: () {
                  Get.toNamed(RoutesNames.enableCountry);
                },
              ),
              SizedBox(height: height * .03),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutesNames.signIn);
                },
                child: Text(
                  "Skip,Not Now",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Inter_Regular",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
