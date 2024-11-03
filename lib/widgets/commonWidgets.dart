import 'package:cineflix/resources/assets/images.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
SizedBox height_space(double? height)=>SizedBox(height: height??10,);
Image logoWidget() => Image.asset(ImagePaths.logo);
Widget onboardIndicator(int index, int total) => SizedBox(
      width: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i in List.generate(total, (index) => index))
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == index
                      ? AppColors().indicator
                      : AppColors().normal_indicator),
            )
        ],
      ),
    );

showLoader()=>Get.dialog(Center(child: CircularProgressIndicator(
  color: const Color(0xFFF2AA4C),
),));

removeLoader()=>Get.back();