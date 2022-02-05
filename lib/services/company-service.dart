import 'package:dio/dio.dart';
import 'package:fuelmetrics_flutter_project/models/add-driver-model.dart';
import 'package:fuelmetrics_flutter_project/services/resource.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/error-handler.dart';
import 'package:get/route_manager.dart';

class CompanyService {
  var _resource = ResourceService();

  Future<Response> getDetails() async {
    try {
      Response response =
          await _resource.request('Company/Details', body: null, method: "Get");
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }

  Future<Response> addDriver(AddDriverRequest model) async {
    try {
      Response response = await _resource.request(
          'Driver/Add/${model.companyId}',
          body: model.toJson(),
          method: "Post");
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }

  Future<Response> getDrivers(String companyId) async {
    try {
      Response response = await _resource.request(
          'Drivers/All?count=true&companyId=$companyId',
          body: null,
          method: "Get");
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }

  Future<Response> deleteDrivers(String companyId, String driverId) async {
    try {
      Response response = await _resource.request(
          'Driver/Delete/$companyId/$driverId',
          body: null,
          method: "Delete");
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }

  Future<Response> editDriver(String driverId, AddDriverRequest model) async {
    try {
      Response response = await _resource.request(
          'Driver/Edit/${model.companyId}/$driverId',
          body: model.toJson(),
          method: "Put");
      return response;
    } on DioError catch (e) {
      Get.back();
      throw ErrorHandler.catchError(e);
    }
  }
}
