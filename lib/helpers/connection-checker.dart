// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';

class InternetHelper {
  static checkInternet({Function? function}) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return function!();
    }

    CommonDialogs.showSnackInfo(
        ' No Internet',
        ' kindly check your internet connection',
        Icons.signal_cellular_connected_no_internet_4_bar,
        Colors.grey,
        iconSize: 40);
  }
}
