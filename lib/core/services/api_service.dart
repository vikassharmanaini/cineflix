import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApiService {
  Future<Map> getbackkgroundbanner() async {
    String jsonString =
        await rootBundle.loadString("assets/temassets/banners.json");
    return json.decode(jsonString);
  }
}
