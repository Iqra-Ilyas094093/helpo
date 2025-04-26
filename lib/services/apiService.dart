import 'dart:convert';
import 'package:login_design/models/registerModel.dart';
import '../models/loginModel.dart';
import 'package:http/http.dart' as http;



class ApiService{

  static const String baseUrl = "http://paykaro.beedesignx.com/api";

  Future<loginModel> login(String email,String password)async{
    final String url = '$baseUrl/login';
    final response = await http.post(Uri.parse(url),body: jsonEncode({"email":email,"password":password}));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body)["data"];
      return loginModel.fromJson(data);
    }else{
      throw Exception("login Failes : ${response.body}");
    }
  }

  Future<registerModel> register(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      return registerModel.fromJson(data);
    } else {
      throw Exception("Registration failed: ${response.body}");
    }
  }




}