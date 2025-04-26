// /// success : true
// /// message : "OTP verified successfully."
// /// user : {"id":21,"email":"iqrailyas093@gmail.com","name":"qirra","is_verified":true}
//
// class OtpVerification {
//   OtpVerification({
//       bool success,
//       String message,
//       User user,}){
//     _success = success;
//     _message = message;
//     _user = user;
// }
//
//   OtpVerification.fromJson(dynamic json) {
//     _success = json['success'];
//     _message = json['message'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//   bool _success;
//   String _message;
//   User _user;
// OtpVerification copyWith({  bool success,
//   String message,
//   User user,
// }) => OtpVerification(  success: success ?? _success,
//   message: message ?? _message,
//   user: user ?? _user,
// );
//   bool get success => _success;
//   String get message => _message;
//   User get user => _user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = _success;
//     map['message'] = _message;
//     if (_user != null) {
//       map['user'] = _user.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 21
// /// email : "iqrailyas093@gmail.com"
// /// name : "qirra"
// /// is_verified : true
//
// class User {
//   User({
//       num id,
//       String email,
//       String name,
//       bool isVerified,}){
//     _id = id;
//     _email = email;
//     _name = name;
//     _isVerified = isVerified;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _email = json['email'];
//     _name = json['name'];
//     _isVerified = json['is_verified'];
//   }
//   num _id;
//   String _email;
//   String _name;
//   bool _isVerified;
// User copyWith({  num id,
//   String email,
//   String name,
//   bool isVerified,
// }) => User(  id: id ?? _id,
//   email: email ?? _email,
//   name: name ?? _name,
//   isVerified: isVerified ?? _isVerified,
// );
//   num get id => _id;
//   String get email => _email;
//   String get name => _name;
//   bool get isVerified => _isVerified;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['email'] = _email;
//     map['name'] = _name;
//     map['is_verified'] = _isVerified;
//     return map;
//   }
//
// }