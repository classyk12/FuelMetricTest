import 'package:fuelmetrics_flutter_project/models/drivers-model.dart';
import 'package:get/get.dart';

class DriverDetailController extends GetxController {
  var detail = DriversModel().obs;

  @override
  void onInit() {
    detail.value = Get.arguments;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
