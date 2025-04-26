import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_design/models/userModel/userModel.dart';
import 'package:login_design/screens/pages/homeScreen/homeScreen.dart';
import 'package:login_design/screens/pages/login/loginScreen.dart';
import 'package:login_design/screens/pages/verification/verificationScreen.dart';
import 'package:login_design/utilites/routes/routes_name.dart';
import 'package:login_design/view_models/user_view_model.dart';

import '../screens/pages/getStarted/getStarted.dart';

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