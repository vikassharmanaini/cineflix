import 'package:cineflix/controllers/AppController.dart';
import 'package:cineflix/views/home/downloadsviews/downloadview.dart';
import 'package:cineflix/views/home/expolrerviews/explorer.dart';
import 'package:cineflix/views/home/searchview/searchviews.dart';
import 'package:cineflix/views/home/walletview/walletView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(
              () => [
                const ExplorerView(),
                const SerchViews(),
                const Walletview(),
                const Downloadview(),
                Container(),
              ][controller.navIndex.value],
            ),
          ),
          Positioned(bottom: 0, child: bottombar())
        ],
      ),
    );
  }

  Obx bottombar() {
    return Obx(
      () => SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          clipBehavior: Clip.hardEdge,
          height: 100,
          width: Get.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 35,
                child: Container(
                  width: Get.width,
                  height: 85,
                  decoration: const BoxDecoration(color: Color(0xFF33363C)),
                ),
              ),
              Positioned(
                left: Get.width/5-50,
                top: 46,
                child: InkWell(
                  onTap: () => controller.navIndex.value = 0,
                  child: SizedBox(
                    width: 27,
                    height: 39.59,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 27.59,
                          child: Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.navIndex.value == 0
                                  ? const Color(0xFFF2AA4C)
                                  : Colors.white,
                              fontSize: 10,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0.19,
                          top: 0,
                          child: Container(
                            width: 26,
                            height: 26,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  TablerIcons.home,
                                  color: controller.navIndex.value == 0
                                      ? const Color(0xFFF2AA4C)
                                      : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
              left: (Get.width/4),
                top: 46,
                child: InkWell(
                  onTap: () => controller.navIndex.value = 1,
                  child: SizedBox(
                    width: 40,
                    height: 39.67,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 4.22,
                          top: 0,
                          child: Container(
                            width: 27,
                            height: 27,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  TablerIcons.search,
                                  color: controller.navIndex.value == 1
                                      ? const Color(0xFFF2AA4C)
                                      : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 27.67,
                          child: Text(
                            'Search',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.navIndex.value == 1
                                  ? const Color(0xFFF2AA4C)
                                  : Colors.white,
                              fontSize: 10,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Get.width/2.3-6,
                top: 34,
                child: Container(
                  width: 81,
                  height: 41,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF2AA4C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Get.width/2.3,
                top: 0,
                child: Container(
                  width: 69,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF33363C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: InkWell(
                    onTap: () => controller.navIndex.value = 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Image.asset(
                              controller.navIndex.value == 2
                                  ? "assets/images/Vector.png"
                                  : "assets/images/Vector_inactive.png",
                              scale: 0.8,
                            )

                            // Icon(
                            //   TablerIcons.wallet,
                            //   color: controller.navIndex.value == 2
                            //       ? Color(0xFFF2AA4C)
                            //       : Colors.white,
                            // ),
                            ),
                        const SizedBox(height: 4),
                        Text(
                          'Wallet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.navIndex.value == 2
                                ? const Color(0xFFF2AA4C)
                                : Colors.white,
                            fontSize: 10,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Get.width/1.5,
                top: 46,
                child: InkWell(
                  onTap: () => controller.navIndex.value = 3,
                  child: SizedBox(
                    width:60,
                    height: 39.59,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 27.59,
                          child: Text(
                            'Downloads',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.navIndex.value == 3
                                  ? const Color(0xFFF2AA4C)
                                  : Colors.white,
                              fontSize: 10,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11.73,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3.38, vertical: 4.22),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  TablerIcons.download,
                                  color: controller.navIndex.value == 3
                                      ? const Color(0xFFF2AA4C)
                                      : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Get.width/1.15,
                top: 46,
                child: InkWell(
                  onTap: () => controller.navIndex.value = 4,
                  child: SizedBox(
                    width: 28,
                    height: 39.65,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 1.60,
                          top: 27.65,
                          child: Text(
                            'More',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.navIndex.value == 4
                                  ? const Color(0xFFF2AA4C)
                                  : Colors.white,
                              fontSize: 10,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 4.47,
                              left: 1,
                              right: 1,
                              bottom: 5.53,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  TablerIcons.list,
                                  color: controller.navIndex.value == 4
                                      ? const Color(0xFFF2AA4C)
                                      : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
