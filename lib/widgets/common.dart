import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/themes.dart';
import 'package:get/get.dart';

class CommonDialogs {
  //snackbar by GET
  static showSnackInfo(String titleText, String messageText, IconData icon,
      Color backgroundColor,
      {double iconSize = 50,
      int duration = 3,
      SnackPosition position = SnackPosition.TOP}) {
    return Get.rawSnackbar(
        title: '',
        message: '',
        snackStyle: SnackStyle.GROUNDED,
        titleText: Text(titleText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        messageText: Text(messageText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        snackPosition: position,
        duration: Duration(seconds: duration),
        icon: Icon(icon, size: iconSize, color: Colors.white),
        //  colorText: Colors.white,
        backgroundColor: backgroundColor);
  }
}

showloader({bool overlay = true, String title = '', String body = ''}) {
  overlay
      ? Get.dialog(
          Scaffold(
            backgroundColor: Colors.grey[900]!.withOpacity(0.5),
            body: Center(child: Loader()),
          ),
          barrierDismissible: false)
      : Center(child: Loader());
}

class Loader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  Loader(
      {this.title = 'Loading',
      this.subtitle = 'Please wait..',
      this.color = Colors.black});

  Widget build(BuildContext context) {
    {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: white,
          ),
          SizedBox(height: 10),
          Text(title, style: loaderHeaderStyle),
          SizedBox(height: 10),
          Text(subtitle, style: loaderbodyStyle),
        ],
      );
    }
  }
}
