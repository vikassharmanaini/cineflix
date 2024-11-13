import 'dart:async';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

class BannerRotated extends StatefulWidget {
  const BannerRotated({super.key});

  @override
  State<BannerRotated> createState() => _BannerRotatedState();
}

class _BannerRotatedState extends State<BannerRotated> {
  final controller = FixedExtentScrollController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startRotating();
  }
int index =0; 
  void startRotating() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int nextItem = (controller.selectedItem + 1) % 5; // Wrap around index
      controller.animateToItem(
        nextItem,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        index=nextItem;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 448,
          color: Colors.black,
          child: RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
              controller: controller,
              diameterRatio: Get.width - 20,
              itemExtent: 448,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  int itemIndex = index % 6;
                  return RotatedBox(
                    quarterTurns: -3,
                    child: Image.network(
                      "https://m.media-amazon.com/images/I/61OmlO9stnL.jpg",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        // Top overlay
        Container(
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Colors.black, Colors.black.withOpacity(0)],
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                width_space(20),
                logoWidget(height: 30),
                Spacer(),
                Icon(Icons.cast),
                width_space(20),
                Icon(
                  TablerIcons.user_circle,
                  color: AppColors().indicator,
                ),
                width_space(20),
              ],
            ),
          ),
        ),
        // Bottom overlay with buttons and indicators
        Positioned(
          bottom: 0,
          child: Container(
            width: Get.width,
            height: 187,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.7)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.info_outline),
                        Text(
                          "Info",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    width_space(30),
                    AppButtons().primary_button(
                      width: 140.0,
                      height: 45.0,
                      label: "Watch now",
                    ),
                    width_space(10),
                  ],
                ),
                height_space(20),
                Center(child: onboardIndicator(index, 5)),
                height_space(10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
