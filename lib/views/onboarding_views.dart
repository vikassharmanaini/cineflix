import 'dart:developer';
import 'dart:math';

import 'package:cineflix/app/routes/app_routes.dart';
import 'package:cineflix/controllers/authController.dart';
import 'package:cineflix/core/constants/app_strings.dart';
import 'package:cineflix/core/services/api_service.dart';
import 'package:cineflix/resources/appTextStyle.dart';
import 'package:cineflix/resources/assets/images.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:reown_appkit/reown_appkit.dart';

class OnboardingViews extends StatefulWidget {
  OnboardingViews({super.key});

  @override
  State<OnboardingViews> createState() => _OnboardingViewsState();
}

class _OnboardingViewsState extends State<OnboardingViews> {
  final controller = PageController();

  final _logincontroller = Get.put(Authcontroller());

  final _appKitModal = ReownAppKitModal(
    context: Get.context!,
    projectId: '0c78392dd1944a7d725e77cf6578c8df',
    metadata: const PairingMetadata(
      name: 'Cinefilix',
      description: 'Enjoy WEB3 OTT',
      url: 'https://example.com/',
      icons: ['https://example.com/logo.png'],
      redirect: Redirect(
          native: 'torusapp://org.torusresearch.flutter.web3authexample',
          universal: 'https://reown.com/exampleapp',
          linkMode: false),
    ),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeWallet();
  }

  initializeWallet() async {
    try {
      await _appKitModal.appKit!.init();
    } catch (e) {
      print(e);
    }

    try {
      await _appKitModal.init();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          onboardView1(),
          onboardView2(),
          onboardView3(),
          onboardView4()
        ],
      ),
    );
  }

  Widget onboardView1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        height_space(10),
        logoWidget(),
        height_space(40),
        Image.asset(ImagePaths.splashwatchlogo),
        SizedBox(
          width: 316,
          child: Column(
            children: [
              Text(
                AppStrings.watch_to_earn,
                style: AppTextStyle().titleLarge,
              ),
              height_space(30),
              Text(
                AppStrings.watch_to_earn_label,
                style: AppTextStyle().titleLabel,
                textAlign: TextAlign.center,
              ),
              height_space(30),
              onboardIndicator(0, 4),
            ],
          ),
        ),
        height_space(50),
        AppButtons().primary_button(callback: () {
          controller.animateToPage(1,
              duration: const Duration(milliseconds: 2), curve: Curves.linear);
        })
      ],
    );
  }

  Widget onboardView2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        height_space(10),
        logoWidget(),
        height_space(40),
        Image.asset(ImagePaths.splashloginlogo),
        SizedBox(
          width: 316,
          child: Column(
            children: [
              Text(
                AppStrings.hassle_free_login,
                textAlign: TextAlign.center,
                style: AppTextStyle().titleLarge,
              ),
              height_space(30),
              Text(
                AppStrings.hassle_free_login_label,
                style: AppTextStyle().titleLabel,
                textAlign: TextAlign.center,
              ),
              height_space(30),
              onboardIndicator(1, 4),
            ],
          ),
        ),
        height_space(50),
        AppButtons().primary_button(callback: () {
          controller.animateToPage(2,
              duration: const Duration(milliseconds: 2), curve: Curves.linear);
        })
      ],
    );
  }

  Widget onboardView3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        height_space(10),
        logoWidget(),
        height_space(40),
        Image.asset(ImagePaths.splashcontentlogo),
        SizedBox(
          width: 316,
          child: Column(
            children: [
              Text(
                AppStrings.free_premium_content,
                textAlign: TextAlign.center,
                style: AppTextStyle().titleLarge,
              ),
              height_space(30),
              Text(
                AppStrings.free_premium_content_label,
                style: AppTextStyle().titleLabel,
                textAlign: TextAlign.center,
              ),
              height_space(30),
              onboardIndicator(2, 4),
            ],
          ),
        ),
        height_space(50),
        AppButtons().primary_button(callback: () {
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 2), curve: Curves.linear);
        })
      ],
    );
  }

  Widget onboardView4() {
    return FutureBuilder(
        future: ApiService().getbackkgroundbanner(),
        builder: (context, snapshot) {
          return SizedBox(
            height: Get.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: Get.width,
                  child: !snapshot.hasData
                      ? Center(child: Text("${snapshot.data} data"))
                      : Column(
                          children: [
                            for (var banner in List.generate(6, (i) {
                              List banner = snapshot.data!['banner'] as List;
                              banner.shuffle(Random());
                              return banner;
                            }))
                              MarqueeList(
                                scrollDirection: Axis.horizontal,
                                scrollDuration: const Duration(seconds: 3),
                                children: [
                                  for (var i in banner)
                                    Image.network(
                                      "$i",
                                      width: 150,
                                      height: 170,
                                      fit: BoxFit.cover,
                                    )
                                ],
                              ),
                          ],
                        ),
                ),
                Container(
                  // height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(-0.21, -0.98),
                      end: const Alignment(0.21, 0.98),
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.5699999928474426),
                        Colors.black.withOpacity(0.9599999785423279)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: logoWidget()),
                      Image.asset(ImagePaths.welcometocineflix),
                      const SizedBox(
                        width: 366,
                        child: Text(
                          'Experience entertainment like never before!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          onboardIndicator(3, 4),
                          height_space(30),
                          AppButtons().secondry_button(ontap: () {
                            _logincontroller.showLogin();
                          }),
                          height_space(30),
                          AppKitModalConnectButton(
                            context: Get.context,
                            appKit: _appKitModal,
                            custom: AppButtons().primary_button(
                                callback: () async {
                                  try {
                                    await _appKitModal.disconnect();
                                    await _appKitModal.openModalView();
                                    if (_appKitModal.isConnected) {
                                      showLoader();
                                      try {
                                        await ApiService().loginwallet(
                                            _appKitModal.session!.address);
                                      } catch (e) {
                                        // TODO
                                      }
                                      removeLoader();
                                      Get.offAllNamed(AppRoutes.profile);
                                    }
                                  } catch (e) {
                                    print(
                                        "error ${(e as ReownAppKitModalException).message}");
                                  }
                                },
                                label: "Connect Web3 Wallet"),
                          ),
                          height_space(30),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(AppRoutes.home);
                            },
                            child: Text("Skip",
                                style: TextStyle(color: AppColors().indicator)),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
