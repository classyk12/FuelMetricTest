import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/controllers/home-controller.dart';
import 'package:fuelmetrics_flutter_project/models/add-driver-model.dart';
import 'package:fuelmetrics_flutter_project/services/company-service.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/error-handler.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';
import 'package:get/get.dart';

class AddDriverController extends GetxController {
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController city = new TextEditingController();
  CompanyService _companyService = CompanyService();
  final _homeController = Get.find<HomeController>();
  String? driverId = '';

  @override
  void onInit() {
    driverId = Get.arguments;
    if (driverId != null && driverId!.isNotEmpty) {
      fillDetails();
    }

    super.onInit();
  }

  void fillDetails() {}

  Future<void> addDriver() async {
    showloader(title: 'Loading..Please wait', body: '');
    var model = AddDriverRequest(
        companyId: _homeController.companyData.value.company!.id,
        userId: _homeController.companyData.value.company!.id,
        name: name.text,
        phone: phone.text,
        email: email.text,
        address: address.text,
        city: city.text,
        state: state.text,
        roles: ['Driver']);
    try {
      var res = await _companyService.addDriver(
        model,
      );
      Get.back();

      if (res.statusCode == 200 || res.statusCode == 201) {
        CommonDialogs.showSnackInfo(
            'Success ', res.data['message'], Icons.info, Colors.green,
            duration: 3, position: SnackPosition.TOP);

        clear();
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

  void clear() {
    name.clear();
    phone.clear();
    address.clear();
    state.clear();
    email.clear();
    city.clear();
  }
}

void fillDetails() {}
