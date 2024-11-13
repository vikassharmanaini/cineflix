import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cineflix/app/routes/app_routes.dart';
import 'package:cineflix/controllers/AppController.dart';
import 'package:cineflix/core/services/api_service.dart';
import 'package:cineflix/core/services/walletService.dart';
import 'package:cineflix/views/home/homeView.dart';
import 'package:cineflix/widgets/bottomsheets/otp_bottomsheet.dart';
import 'package:cineflix/widgets/bottomsheets/phone_bottomsheet.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_toast/m_toast.dart';

class Authcontroller extends GetxController {
  ApiService _apiService = ApiService();
  WalletService _walletService = WalletService();
  
  showLogin() {
    Get.bottomSheet(LoginPhone(),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent);
  }

  TextEditingController mobileEC = TextEditingController();
  RxString mobileEr = "".obs;
  TextEditingController otpEC = TextEditingController();
  RxString otpEr = "".obs;
  verifyOtp() async {
    if (!GetUtils.isPhoneNumber(mobileEC.text) || mobileEC.text.length != 10) {
      mobileEr.value = "Please enter valid mobile number";
      return;
    }
    showLoader();
    final response = await _apiService.sendOTP(mobileEC.text);
    print(response.data);
    removeLoader();
    Get.bottomSheet(OtpBottomSheet());
  }

  loginOtp() async {
    if (otpEC.text.length != 6) {
      otpEr.value = "Please Enter valid OTP";
      return;
    }
    showLoader();
    final response = await _apiService.sendVerifyOtp(mobileEC.text, otpEC.text);
    log("otp :::::: ${json.encode(response.data)}");
    Get.find<AppController>().accountToken = response.data['accountToken'];
    final profile = response.data['accountDetail']['profiles'];
    removeLoader();
    Get.back();
    Get..back();
    Get.toNamed(AppRoutes.profile);
  }

  loginWithWallet() async {
    _walletService.initConnetion();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  Rx<Uint8List> imagedata = Uint8List(0).obs;

  createProfile() async {
  
    if (name.text.isEmpty || !GetUtils.isEmail(email.text) || dob.text.isEmpty)
      return;
    showLoader();
    String token = Get.find<AppController>().accountToken;
    final response = await _apiService.createProfile(
        headerToken: token,
        image: imagedata.value,
        username: name.text,
        email: email.text,
        mobilenumber: mobileEC.text,
        dob: dob.text);
    log("create Profile ::::: ${response.data}");
    removeLoader();
    Get.offAll(HomeView());
  }
}
