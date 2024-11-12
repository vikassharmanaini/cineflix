import 'dart:io';

import 'package:cineflix/resources/assets/images.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Walletview extends StatelessWidget {
  const Walletview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().spacialCanvasColor,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
          ),
          Image.asset(
            ImagePaths.wavebg2,
            width: 880,
            height: 250,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Platform.isIOS
                        ? Icons.arrow_back_ios_new
                        : Icons.arrow_back),
                    Expanded(
                        child: Center(
                      child: Text(
                        'Wallet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 50,
                    )
                  ],
                )),
                SizedBox(
                  height: 70,
                ),
                Text(
                  '1098.7652 CNF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w800,
                    height: 0.02,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  'Current Balance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.arrow_up_right_diamond,
                          color: AppColors().indicator,
                        ),
                        Text("Withdraw")
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: AppColors().indicator,
                        ),
                        Text("Withdraw")
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: AppColors().indicator,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 374,
                  height: 18,
                  child: Text(
                    'Transaction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.99,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      height: 0.03,
                      letterSpacing: -0.07,
                    ),
                  ),
                ),
                for (int i in List.generate(8, (i) => i))
                  Container(
                    width: Get.width - 40,
                    height: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Oct 8, 2024 at 06:11AM',
                                style: TextStyle(
                                  color: Color(0xFF8596A2),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                  letterSpacing: 0.20,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Suits - S07E02',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w400,
                                  height: 0.06,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '53.4 CNF',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: [
                                    const Color(0xFF00C48C),
                                    const Color(0xFFAC3B47),
                                    AppColors().indicator
                                  ][i % 3],
                                  fontSize: 20,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              // const SizedBox(height: 12),
                              // Text(
                              //   '1:13:00',
                              //   style: TextStyle(
                              //     color: Color(0xFF8596A2),
                              //     fontSize: 14,
                              //     fontFamily: 'SF Pro',
                              //     fontWeight: FontWeight.w400,
                              //     height: 0.09,
                              //     letterSpacing: 0.20,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
