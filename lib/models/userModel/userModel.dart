class OtpResponse {
  final bool success;
  final String message;
  final UserData data;

  OtpResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int userId;
  final String email;
  final bool verified;
  final String token;

  UserData({
    required this.userId,
    required this.email,
    required this.verified,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['user_id'],
      email: json['email'],
      verified: json['verified'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'verified': verified,
      'token': token,
    };
  }
}
