import 'package:cineflix/controllers/authController.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:cineflix/widgets/app_text_feild.dart';
import 'package:country_picker/country_picker.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPhone extends StatelessWidget {
  LoginPhone({super.key});
  final _authController = Get.find<Authcontroller>();
  final number = "".obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff000040e),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 406,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 126,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Enter Your \nMobile Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Please provide your mobile number to receive a one-time password (OTP).',
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
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF242424),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Theme(
                                        data: Theme.of(context).copyWith(
                                            primaryColor: Colors.pink),
                                        child: CountryPickerDialog(
                                            titlePadding: const EdgeInsets.all(8.0),
                                            searchCursorColor:
                                                Colors.pinkAccent,
                                            searchInputDecoration:
                                                const InputDecoration(
                                                    hintText: 'Search...'),
                                            isSearchable: true,
                                            title:
                                                const Text('Select your phone code'),
                                            onValuePicked: (country) =>
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      CountryPickerUtils
                                                          .getDefaultFlagImage(
                                                              country),
                                                      const SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Text(
                                                          "+${country.phoneCode}(${country.isoCode})"),
                                                    ],
                                                  ),
                                                ))),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(Country.parse("IN").flagEmoji)
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      '+91',
                                      style: TextStyle(
                                        color: Color(0xFF8596A2),
                                        fontSize: 16,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 0.07,
                                        letterSpacing: 0.20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: AppTextFeild(
                              text: number,
                              EC: _authController.mobileEC,
                            )),
                          ],
                        ),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            const SizedBox(
                              width: 132,
                            ),
                            if (_authController.mobileEr.value.isNotEmpty)
                              Expanded(
                                  child: Text(
                                _authController.mobileEr.value,
                                style: Get.textTheme.labelMedium!
                                    .copyWith(color: Colors.red),
                              ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 62),
                Obx(
                  () => Center(
                    child: AppButtons().primary_button(
                        label: "Send OTP",
                        isdissable: !GetUtils.isPhoneNumber(number.value),
                        callback: _authController.verifyOtp),
                  ),
                ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 62),
                SizedBox(
                  width: double.infinity,
                  child: const Row(
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
                      SizedBox(width: 4),
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
        ],
      ),
    );
  }
}
