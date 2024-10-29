import 'package:cineflix/controllers/AppController.dart';
import 'package:cineflix/resources/assets/images.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
Get.find<AppController>().splashinitilized();
    return Scaffold(
      backgroundColor: AppColors().spacialCanvasColor,
      body: Stack(
        children: [Center(
          child:logoWidget(),
        ), Image.asset(ImagePaths.wavebg)],
      ),
    );
  }

 
}
