import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_sm/forgetViews/forget_view.dart';
import 'package:task_sm/locationViews/enable_country_view.dart';
import 'package:task_sm/locationViews/enable_location_view.dart';
import 'package:task_sm/onboardingViews/onboarding_view.dart';
import 'package:task_sm/productViews/product_views.dart';
import 'package:task_sm/resetViews/reset_view.dart';
import 'package:task_sm/routes/routes_names.dart';
import 'package:task_sm/signInViews/singin_view.dart';
import 'package:task_sm/signUpViews/sign_up_views.dart';
import 'package:task_sm/splash_screen.dart';

class RoutesPages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RoutesNames.splashScreen, page: () => SplashScreen()),

    GetPage(name: RoutesNames.onboarding, page: () => OnboardingView()),

    GetPage(name: RoutesNames.signIn, page: () => SinginView()),

    GetPage(name: RoutesNames.singUp, page: () => SignUpViews()),

    GetPage(name: RoutesNames.forget, page: () => ForgetView()),

    GetPage(name: RoutesNames.reset, page: () => ResetView()),

    GetPage(name: RoutesNames.enableLocation, page: () => EnableLocationView()),

    GetPage(name: RoutesNames.enableCountry, page: () => EnableCountryView()),

    GetPage(name: RoutesNames.product, page: () => ProductViews()),
  ];
}
