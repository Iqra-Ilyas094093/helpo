class loginModel {
  final String email;
  final String password;

  loginModel({required this.email, required this.password});

  factory loginModel.fromJson(Map<String, dynamic> json) {
    return loginModel(email: json["email"], password: json["password"],);
  }

}
