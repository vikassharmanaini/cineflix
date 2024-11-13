import 'package:cineflix/app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final pathProvider =await getApplicationDocumentsDirectory();
  Hive.init(pathProvider.path,backendPreference: HiveStorageBackendPreference.native);
  runApp(const App());
}
