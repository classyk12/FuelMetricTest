import 'package:dio/dio.dart';
import 'package:fuelmetrics_flutter_project/services/resource.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/error-handler.dart';

class AuthService {
  var _resource = ResourceService();

  Future<Response> login({String? email, String? password}) async {
    var body = {"email": email, "password": password};
    try {
      Response response =
          await _resource.request('login', body: body, method: "Post");
      return response;
    } on DioError catch (e) {
      throw ErrorHandler.catchError(e);
    }
  }
}
