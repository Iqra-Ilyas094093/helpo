class registerModel{
  final String name;
  final String email;
  final String password;

  registerModel({required this.name, required this.email,required this.password});

  factory registerModel.fromJson(Map<String, dynamic> json) {
    return registerModel(
      name: json["name"], email: json["email"], password: json["password"],);
  }

}