import 'package:cineflix/app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final path_provider =await getApplicationDocumentsDirectory();
  Hive.init(path_provider.path,backendPreference: HiveStorageBackendPreference.native);
  runApp(const App());
}
