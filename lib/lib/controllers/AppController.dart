import 'package:cineflix/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  String accountToken = "";
  RxInt navIndex = 0.obs;
  splashinitilized(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.onboard);
      });
  }
}