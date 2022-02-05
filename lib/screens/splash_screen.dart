import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      Get.offNamed('/login'); //add your navigation route here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png',
                    height: 150.0, width: 150),
                Text('FUELMETRICS TEST APP',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decorationColor: Colors.transparent,
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins'))
              ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
