import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/themes.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? borderColor;
  const Button(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.height,
      this.borderColor = Colors.transparent,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: this.height ?? Get.height * 0.1,
        width: this.width ?? Get.width * 0.8,
        decoration: BoxDecoration(
            color: primaryGreen,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: this.borderColor!)),
        child: Center(
          child: Text(title, style: buttonTextStyle),
        ),
      ),
    );
  }
}
