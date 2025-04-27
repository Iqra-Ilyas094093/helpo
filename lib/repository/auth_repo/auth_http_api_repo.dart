import 'package:http/http.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../models/userModel/userModel.dart';
import '../../utilites/validators/app_url.dart';

class AuthHttpApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<Response?> loginApi(dynamic data) async {
    try {
      Response response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Response?> registerApi(dynamic data) async {
    try {
      Response response = await _apiServices.getPostApiResponse(
        AppUrl.registerApiEndPoint,
        data,
      );
      return response;
    } catch (e) {

      print(e.toString());
    }
  }

  Future<dynamic> otpVerificationApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.verifyOtpEndPoint,
        data,
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
  Future<dynamic> forgotPasswordApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.forgotPasswordEndPoint,
        data,
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
