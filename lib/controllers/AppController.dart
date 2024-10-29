import 'package:cineflix/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  splashinitilized(){
    Future.delayed(Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.onboard);
      });
  }
}