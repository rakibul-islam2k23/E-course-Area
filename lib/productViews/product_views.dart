import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_sm/controller/onboarding_controller.dart';
import 'package:task_sm/widgets/product_sample.dart';

class ProductViews extends StatelessWidget {
  const ProductViews({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter_Regular",
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.7),
                    fontFamily: "Inter_Regular",
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: height * .03),

              Container(
                padding: EdgeInsets.all(15),
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * .6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Exclusive Offer",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter_Regular",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            maxLines: 3,
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.6),
                              fontFamily: "Inter_Regular",
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .03),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter_Regular",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Inter_Regular",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),

              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.productList.isEmpty) {
                  return const Center(child: Text('No products found'));
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: controller.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: .7,
                      ),
                      itemBuilder: (context, index) {
                        final product = controller.productList[index];

                        final color =
                            product.data?["color"]?.toString() ?? "N/A";
                        final capacity =
                            product.data?["capacity"]?.toString() ?? "N/A";
                        return ProductSample(
                          name: product.name,
                          color: color,
                          capacity: capacity,
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
