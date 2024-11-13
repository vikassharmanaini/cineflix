import 'package:cineflix/controllers/authController.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpBottomSheet extends StatelessWidget {
  OtpBottomSheet({super.key});
  final _controller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF00040E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Container(
        height: 373,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 177,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 93,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Check your messages for the OTP and enter it below',
                            style: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 20,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    width: double.infinity,
                    child: Pinput(
                      length: 6,
                      controller: _controller.otpEC,
                      defaultPinTheme: PinTheme(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF242424),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 62),
            Center(
              child: AppButtons().primary_button(
                  label: "Verify OTP", callback: _controller.loginOtp),
            ),
            const SizedBox(height: 62),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'or',
                    style: TextStyle(
                      color: Color(0xFF8596A2),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Connect Web3 Wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF2AA4C),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
