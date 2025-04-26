import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_design/models/userModel/userModel.dart';
import 'package:login_design/view_models/user_view_model.dart';
import '../views/pages/getStarted/getStarted.dart';
import '../views/pages/homeScreen/homeScreen.dart';
import '../views/pages/verification/verificationScreen.dart';

class splashServices {
  Future<OtpResponse> getUserData() => UserViewModel().getUser();

   checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value)async {
          if (value.success == false || value.data.token == "") {
            Future.delayed(Duration(seconds: 4));
            return getStarted();
          } else if (value.data.verified == false && value.data.token != null) {
            Future.delayed(Duration(seconds: 4));
            return verificationScreen();
          } else {
            Future.delayed(Duration(seconds: 4));
            return homeScreen();
          }
        });

  }
}