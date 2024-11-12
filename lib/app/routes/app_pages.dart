import 'package:cineflix/app/routes/app_routes.dart';
import 'package:cineflix/views/createProfile.dart';
import 'package:cineflix/views/home/homeView.dart';
import 'package:cineflix/views/onboarding_views.dart';
import 'package:cineflix/views/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  List<GetPage> pages = <GetPage>[
    GetPage(name: AppRoutes.splash, page: () => SplashView()),
    GetPage(name: AppRoutes.onboard, page: () => OnboardingViews()),
    GetPage(name: AppRoutes.profile, page: () => CreateProfileView()),
    GetPage(name: AppRoutes.home, page: ()=>HomeView())
  ];
}
