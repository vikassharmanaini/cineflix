import 'package:cineflix/app/routes/app_routes.dart';
import 'package:cineflix/views/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {

  List<GetPage> pages= <GetPage>[
    GetPage(name:AppRoutes.splash, page: ()=> SplashView()),
  
  ];
}