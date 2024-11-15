import 'dart:convert';
import 'dart:developer';

import 'package:cineflix/core/services/apiindex.dart';
import 'package:dio/dio.dart';
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

  Future<Response> sendOTP(mobile, code) async {
    final response = await _dio.post(_apiService.sendOTP,
        data: {"mobile": mobile, "code": code},
        options: Options(
          headers: _header,
        ));
    log("url ${_apiService.sendOTP} data ${{
      "mobile": mobile
    }} response ${response.data}");
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

    try {
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
    } catch (e) {
      // TODO
      return (e as DioException).response!;
    }
  }

  Future<Response> getTranding() async {
    final re = await _dio.get(_apiService.getTrending);
    // try {
    //   (re.data['trends'] as List).map((e) => MediaContent.fromJson(e)).toList();
    // } catch (e, s) {
    //   log("$e $s");
    // }
    return re;
  }

  Future<Response> getNewRelease() async {
    // try{

    // }
    final re = await _dio.get(_apiService.getNewReleases);

    return re;
  }
}
