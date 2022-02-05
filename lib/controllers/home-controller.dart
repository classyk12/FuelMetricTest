import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/enums/loading-enum.dart';
import 'package:fuelmetrics_flutter_project/models/company-detail.dart';
import 'package:fuelmetrics_flutter_project/models/drivers-model.dart';
import 'package:fuelmetrics_flutter_project/services/company-service.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/error-handler.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var status = LoadingEnum.idle.obs;
  var getDriverstatus = LoadingEnum.idle.obs;
  var showDrivers = false.obs;

  CompanyService _companyService = CompanyService();
  var drivers = <DriversModel>[].obs;
  var companyData = CompanyDetailData().obs;

  @override
  void onInit() {
    getCompanyDetails();
    super.onInit();
  }

  //add your controller actions here
  Future<void> getCompanyDetails() async {
    status.value = LoadingEnum.loading;
    try {
      var res = await _companyService.getDetails();
      status.value = LoadingEnum.done;
      if (res.statusCode == 200 || res.statusCode == 201) {
        var data = GetCompanyDetailsModel.fromJson(res.data);
        if (data.status!.toLowerCase() == 'successful') {
          companyData.value = data.data!;
        }
      } else {
        status.value = LoadingEnum.failed;
        CommonDialogs.showSnackInfo(
            ' Error',
            ' An error occured getting customer details, please try again',
            Icons.info,
            Colors.red,
            duration: 4,
            position: SnackPosition.TOP);
      }
    } catch (err) {
      status.value = LoadingEnum.failed;
      debugPrint('get customer detail error - ${err.toString()}');

      ErrorHandler.catchError(err);
    }
  }

  Future<void> getCompanyDrivers() async {
    getDriverstatus.value = LoadingEnum.loading;
    try {
      var res =
          await _companyService.getDrivers(companyData.value.company!.id!);
      getDriverstatus.value = LoadingEnum.done;
      if (res.statusCode == 200 || res.statusCode == 201) {
        drivers.value = driversModelFromMap(res.data);
      } else {
        getDriverstatus.value = LoadingEnum.failed;
        CommonDialogs.showSnackInfo(
            ' Error',
            ' An error occured getting customer details, please try again',
            Icons.info,
            Colors.red,
            duration: 4,
            position: SnackPosition.TOP);
      }
    } catch (err) {
      getDriverstatus.value = LoadingEnum.failed;
      debugPrint('get drivers error - ${err.toString()}');

      ErrorHandler.catchError(err);
    }
  }

  Future<void> removeDriver(String driverId, int index) async {
    showloader();
    try {
      var res = await _companyService.deleteDrivers(
          companyData.value.company!.id!, driverId);
      Get.back();
      if (res.statusCode == 200 || res.statusCode == 201) {
        //remove driver at index
        drivers.removeAt(index);
        CommonDialogs.showSnackInfo(' Success', ' Driver deleted successfully',
            Icons.info, Colors.green,
            duration: 3, position: SnackPosition.TOP);
      } else {
        CommonDialogs.showSnackInfo(
            ' Error',
            ' Could not delete driver at the moment, try again',
            Icons.info,
            Colors.red,
            duration: 4,
            position: SnackPosition.TOP);
      }
    } catch (err) {
      Get.back();

      //   getDriverstatus.value = LoadingEnum.failed;
      debugPrint('get drivers error - ${err.toString()}');

      ErrorHandler.catchError(err);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
