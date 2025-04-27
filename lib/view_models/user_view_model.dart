import 'package:flutter/material.dart';
import 'package:login_design/models/userModel/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(OtpResponse response)async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    await sp.setBool('success',response.success);
    await sp.setString('message', response.message);
    await sp.setString('token', response.data.token.toString());
    await sp.setInt("user_id", response.data.userId);
    await sp.setBool("verified", response.data.verified);
    await sp.setString("email", response.data.email);
    notifyListeners();
    return true;
  }


  Future<OtpResponse> getUser()async{
     SharedPreferences sp = await SharedPreferences.getInstance();
     bool? success = sp.getBool("success");
    String message = sp.getString("message").toString();
     String token = sp.getString("token").toString();
    int userId = sp.getInt("user_id")!.toInt();
     bool verified = sp.getBool("verified")!;
     String email = sp.getString("email")!;
    return OtpResponse(success: success!, message: message, data: UserData(userId: userId, email: email, verified: verified, token: token));
  }
  Future<bool> remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

}