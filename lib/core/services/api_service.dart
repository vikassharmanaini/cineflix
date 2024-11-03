import 'dart:convert';
import 'dart:developer';

import 'package:cineflix/core/services/apiindex.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApiService {
  final _dio = Dio();
  final _header = {"Content-Type": "application/json"};
  final _apiService = ApiIndex();
  Future<String?> _imageUpload(Uint8List imageData) async {
    try {
      final response = await Dio().post(
        'https://api.imgbb.com/1/upload',
        queryParameters: {
          'expiration': '600',
          'key': '38272d23b41539d4baf58cd3ed76912d',
        },
        data: FormData.fromMap({
          'image': base64Encode(imageData),
        }),
      );
      log("Image Uploaded");
      return response.statusCode == 200 ? response.data['data']['url'] : null;
    } catch (e) {
      log("Image Uploadeding ::::: $e");
      return null;
    }
  }

  Future<Map> getbackkgroundbanner() async {
    String jsonString =
        await rootBundle.loadString("assets/temassets/banners.json");
    return json.decode(jsonString);
  }

  Future<Response> sendOTP(mobile) async {
    final response = await _dio.post(_apiService.sendOTP,
        data: {"mobile": mobile},
        options: Options(
          headers: _header,
        ));

    return response;
  }

  Future<Response> sendVerifyOtp(mobile, otp) async {
    return await _dio.post(_apiService.verifyOTP,
        data: {"mobile": mobile, "otp": otp},
        options: Options(
          headers: _header,
        ));
  }

  Future<Response> loginwallet(walletaddress) async {
    return await _dio.post(_apiService.loginwallet,
        data: {"walletaddress": walletaddress},
        options: Options(
          headers: _header,
        ));
  }

  Future<Response> createProfile(
      {required String headerToken,
      required Uint8List image,
      required String username,
      required String email,
      required String mobilenumber,
      required String dob}) async {
    String? imageurl = await _imageUpload(image);
    log("request :::: ${{
      ..._header,
      "Authorization": "Bearer $headerToken"
    }} ${{
      "email": email,
      "dob": dob,
      "mobile": mobilenumber,
      "profile": imageurl,
      "userName": username
    }}");

    final response = await _dio.post(_apiService.createprofile,
        data: {
          "email": email,
          "dob": dob,
          "mobile": mobilenumber,
          "profile": imageurl,
          "userName": username
        },
        options: Options(
            headers: {..._header, "Authorization": "Bearer $headerToken"}));
    log("request :::: ${response.data}");
    return response;
  }
}
