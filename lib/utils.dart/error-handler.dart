import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static String handleError(DioError error) {
    String errorDescription = "Something went wrong. Please try again later";

    if (error.message.contains('SocketException')) {
      return errorDescription =
          'It seeems you are not connected to the internet, kindly check your connection and try again';
    }

    if (error.type == DioErrorType.connectTimeout) {
      errorDescription = 'connection timeout';
    }

    if (error.type == DioErrorType.response) {
      errorDescription = 'Something went wrong. Please try again later';
    }

    return errorDescription;
  }

  static catchError(err) {
    String error = '';
    try {
      //check if its a dio error
      if (err is DioError) {
        error = ErrorHandler.handleError(err);
      } else {
        error = 'An unexpected error occurred, try again';
      }

      CommonDialogs.showSnackInfo(
          ' Something went wrong', error, Icons.info, Colors.red,
          duration: 3, position: SnackPosition.TOP);

      //     elevation: 20);
    } catch (ex) {
      print('error handler exception - $ex');
    }
  }
}
