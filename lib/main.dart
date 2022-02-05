import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuelmetrics_flutter_project/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await GetStorage.init();
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MY BASE FLUTTER APP',
        // theme: lightTheme, //add theme if you need one
        initialRoute: '/splash',
        getPages: routeConstants());
  }
}
