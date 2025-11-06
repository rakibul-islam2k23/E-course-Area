import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:task_sm/models/product_model.dart';
import 'package:task_sm/views/signInViews/singin_view.dart';
import 'package:task_sm/widgets/onboarding_page.dart';

class OnboardingController extends GetxController {
  final pages = [
    OnboardingPage(
      image: "assets/images/onboarding_one.png",
      title: "Best online courses in the world",
      subTitle:
          "Now you can learn anywhere, anytime, even if there is no internet access!",
      buttonText: "Next",
    ),
    OnboardingPage(
      image: "assets/images/onboarding_two.png",
      title: "Explore your new skill today",
      subTitle:
          "Our platform is designed to help you explore new skills. Let's learn & grow with Eduline!",
      buttonText: "Get Started",
    ),
  ];
  final pageController = PageController();
  var currentPage = 0.obs;
  final storage = GetStorage();

  void onPageChanged(int index) => currentPage.value = index;

  bool get isLastPage => currentPage.value == pages.length - 1;

  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void completeOnboarding() {
    storage.write('onboarding_seen', true);
    Get.offAll(() => const SinginView());
  }

  bool hasSeenOnboarding() {
    return storage.read('onboarding_seen') ?? false;
  }

  var toggleValue = true.obs;
  bool toggleVisivility() {
    return toggleValue.value = !toggleValue.value;
  }

  var toggleBox = true.obs;
  bool rememberBox() {
    return toggleBox.value = !toggleBox.value;
  }

  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://api.restful-api.dev/objects'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        productList.value = data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
