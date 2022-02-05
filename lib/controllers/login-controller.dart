import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/models/auth-model.dart';
import 'package:fuelmetrics_flutter_project/services/auth-service.dart';
import 'package:fuelmetrics_flutter_project/services/storage.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/error-handler.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  AuthService _authService = AuthService();
  var isPassword = true.obs;
  LoginSuccessResponseModel? loginResponse;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    showloader(title: 'Loading..Please wait', body: '');
    try {
      var res =
          await _authService.login(email: email.text, password: password.text);
      Get.back();

      if (res.statusCode == 200 || res.statusCode == 201) {
        loginResponse = LoginSuccessResponseModel.fromJson(res.data);

        //save details to local
        // await Storage.save('user_data', loginResponse!.toJson());
        await Storage.save('token', loginResponse!.token!);
        Get.offNamed('/dashboard');
      } else {
        CommonDialogs.showSnackInfo(
            'Error ', res.data['message'], Icons.info, Colors.red,
            duration: 3, position: SnackPosition.TOP);
      }
    } catch (err) {
      Get.back();
      ErrorHandler.catchError(err);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
