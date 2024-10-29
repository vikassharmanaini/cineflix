import 'package:cineflix/controllers/AppController.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AppController());
  }
  
}