import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_design/models/userModel/userModel.dart';
import 'package:login_design/repository/auth_repo/auth_http_api_repo.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/view_models/user_view_model.dart';

import '../utilites/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthHttpApiRepository();

  Future<void> loginApi(dynamic data, context) async {
    await _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage(value.toString(), context);
      // Navigator.pushReplacementNamed(context, RoutesName.verification);
      print(value.toString());
    }).onError((error, stackTrace) {
      // Utils.flushBarErrorMessage(error.toString(), context);
      // print(error.toString());
      // print(stackTrace.toString());
    });
  }


  Future<void> registerApi(dynamic data,context) async {
    _myRepo.registerApi(data).then((value) {
    if(kDebugMode){
      Utils.flushBarErrorMessage('Register Successfully', context);
      Navigator.pushNamed(context, RoutesName.verification);
      print(value.toString());
    }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
        print(stackTrace.toString());
      }
    });
  }

  Future<void> otpVerificationApi(dynamic data,context) async {
    _myRepo.otpVerificationApi(data).then((value) {
    if(kDebugMode){
      Utils.flushBarErrorMessage('otp Verified', context);
      Navigator.pushReplacementNamed(context, RoutesName.home);
      print(value.toString());
    }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
        print(stackTrace.toString());
      }
    });
  }


  Future<void> forgotPasswordApi(dynamic data,context) async {
    _myRepo.forgotPasswordApi(data).then((value) {
    if(kDebugMode){
      Utils.flushBarErrorMessage('Reset Password Email has been sent', context);
      Navigator.pushReplacementNamed(context, RoutesName.login);
      print(value.toString());
    }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
        print(stackTrace.toString());
      }
    });
  }
}
