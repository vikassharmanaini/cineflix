import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox vertical_space2() => const SizedBox(
      height: 20,
    );
SizedBox vertical_space() => const SizedBox(
      height: 10,
    );
SizedBox vertical_spacehalf() => const SizedBox(
      height: 5,
    );
SizedBox horizontal_space2() => const SizedBox(
      width: 20,
    );
SizedBox horizontal_space() => const SizedBox(
      width: 10,
    );
SizedBox horizontal_spacehalf() => const SizedBox(
      width: 5,
    );

Widget IntroController(index, total) => Hero(
      tag: "IntroController",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i in List.generate(total, (i) => i))
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == index ? Colors.amber : Colors.white),
            )
        ],
      ),
    );
showLoader() => Get.dialog(
    PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    ),
    barrierDismissible: false);
removeLoader() => Get.back();
