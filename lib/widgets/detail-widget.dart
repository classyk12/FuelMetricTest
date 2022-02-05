import 'package:flutter/material.dart';

Widget detailCard(String title, String value) {
  return Column(
    children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value)]),
      SizedBox(height: 5),
      Divider(color: Colors.grey[200]),
      SizedBox(height: 5),
    ],
  );
}
